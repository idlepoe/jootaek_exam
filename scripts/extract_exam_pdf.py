"""
Extract 주택관리사(보) 1차 교사용 PDFs to JSON (README schema).

Usage:
  python -m scripts.extract_exam_pdf --input assets/pdfs --output data/extracted/all.json
  python -m scripts.extract_exam_pdf --input assets/pdfs --output-dir data/extracted
  python -m scripts.extract_exam_pdf --input assets/pdfs/주택관리사보1차20080907(교사용).pdf \\
      --output data/extracted/2008-09-07.json --dump-text data/extracted/_dump.txt
"""

from __future__ import annotations

import argparse
import json
import re
import sys
from pathlib import Path

import fitz

# Circled 1-5 (wrong options in teacher PDF)
MARK_WHITE = "①②③④⑤"
# Negative circled 1-5 (correct answer marker in COM CBT teacher PDFs)
MARK_NEG = "❶❷❸❹❺"

MARK_TO_NUM: dict[str, int] = {}
for i, ch in enumerate(MARK_WHITE):
    MARK_TO_NUM[ch] = i + 1
for i, ch in enumerate(MARK_NEG):
    MARK_TO_NUM[ch] = i + 1

CHOICE_MARKERS = re.compile("[①②③④⑤❶❷❸❹❺]")
QUESTION_START = re.compile(r"^(\d{1,3})\.\s+(.*)$")
HEADER_PREFIXES = (
    "주택관리사보",
    "전자문제집 CBT",
    "최강 자격증 기출문제",
)
FOOTER_PREFIXES = (
    "기출문제 및 해설집",
    "종이 문제집이 아닌",
    "PC 버전 및 어플",
    "오답 및 오탈자",
    "에서 확인하세요",
    "www.comcbt.com",
    "https://",
)
SUBJECT_LINE = re.compile(r"^\s*\d과목\s*:")
FILENAME_DATE = re.compile(
    r"주택관리사보1차(?P<ymd>\d{8})\(교사용\)\.pdf$",
    re.IGNORECASE,
)


def parse_filename_meta(path: Path) -> tuple[str, str]:
    """
    Returns (exam_type, exam_session ISO date YYYY-MM-DD) from filename.
    exam_type is fixed 주택관리사보1차 for matched files.
    """
    m = FILENAME_DATE.search(path.name)
    if not m:
        raise ValueError(f"Filename not recognized (expected …1차YYYYMMDD(교사용).pdf): {path.name}")
    ymd = m.group("ymd")
    session = f"{ymd[:4]}-{ymd[4:6]}-{ymd[6:8]}"
    return "주택관리사보1차", session


def subject_for_question_number(n: int) -> str:
    if 1 <= n <= 40:
        return "민법"
    if 41 <= n <= 80:
        return "회계원리"
    if 81 <= n <= 120:
        return "공동주택시설개론"
    raise ValueError(f"question_number out of range 1-120: {n}")


def make_question_id(session_compact: str, qn: int) -> str:
    return f"jootaek1_{session_compact}_{qn}"


def split_choice_segments(line: str) -> list[tuple[str, str]]:
    """
    One physical line may contain multiple choices (e.g. '① ... ② ...').
    If the line only repeats the same marker (e.g. '① ①' as placeholder text),
    treat as a single choice.
    """
    matches = list(CHOICE_MARKERS.finditer(line))
    if not matches:
        return []
    glyphs = [m.group(0) for m in matches]
    if len(matches) >= 2 and len(set(glyphs)) == 1:
        m0 = matches[0]
        return [(m0.group(0), line[m0.end() :].strip())]

    out: list[tuple[str, str]] = []
    for i, m in enumerate(matches):
        marker = m.group(0)
        start = m.end()
        end = matches[i + 1].start() if i + 1 < len(matches) else len(line)
        body = line[start:end].strip()
        out.append((marker, body))
    return out


def strip_noise_lines(text: str) -> str:
    lines_out: list[str] = []
    for line in text.splitlines():
        s = line.strip()
        if not s:
            lines_out.append("")
            continue
        if SUBJECT_LINE.match(line):
            continue
        if any(s.startswith(p) for p in HEADER_PREFIXES):
            continue
        lines_out.append(line)
    return "\n".join(lines_out)


def split_into_question_blocks(cleaned: str) -> list[str]:
    """Split on lines that start a new question: '12. ...'"""
    lines = cleaned.splitlines()
    blocks: list[str] = []
    current: list[str] = []
    for line in lines:
        stripped = line.strip()
        if stripped and QUESTION_START.match(stripped):
            if current:
                blocks.append("\n".join(current))
            current = [line]
        else:
            if current:
                current.append(line)
    if current:
        blocks.append("\n".join(current))
    return blocks


def is_footer_line(line: str) -> bool:
    s = line.strip()
    return any(s.startswith(p) for p in FOOTER_PREFIXES)


def parse_question_block(block: str, exam_type: str, session: str, session_compact: str) -> dict | None:
    lines = block.splitlines()
    if not lines:
        return None
    first = lines[0].strip()
    m = QUESTION_START.match(first)
    if not m:
        return None
    qn = int(m.group(1))
    stem_buf: list[str] = [m.group(2).strip()] if m.group(2).strip() else []
    choices: list[dict] = []

    for raw in lines[1:]:
        line = raw.strip()
        if not line:
            continue
        segments = split_choice_segments(line)
        if segments:
            if len(choices) >= 5:
                break
            for marker, body in segments:
                if len(choices) >= 5:
                    break
                is_correct = marker in MARK_NEG
                num = MARK_TO_NUM[marker]
                choices.append({"no": num, "text": body, "_correct": is_correct})
        else:
            if choices:
                if len(choices) >= 5 and is_footer_line(line):
                    break
                choices[-1]["text"] = (choices[-1]["text"] + " " + line).strip()
            else:
                stem_buf.append(line)

    stem = " ".join(x for x in stem_buf if x).strip()
    if not stem or len(choices) != 5:
        return None

    correct = [c["no"] for c in choices if c.get("_correct")]
    if not correct:
        return None
    correct_no = correct[0]

    choices_out = [{"no": c["no"], "text": c["text"]} for c in sorted(choices, key=lambda x: x["no"])]

    subject = subject_for_question_number(qn)
    return {
        "id": make_question_id(session_compact, qn),
        "exam_type": exam_type,
        "exam_session": session,
        "subject": subject,
        "question_number": qn,
        "question_text": stem,
        "choices": choices_out,
        "correct_answer": correct_no,
    }


def pdf_to_raw_text(path: Path) -> str:
    doc = fitz.open(path)
    try:
        parts = [doc[i].get_text() for i in range(len(doc))]
        return "\n".join(parts)
    finally:
        doc.close()


def extract_questions_from_text(
    raw: str,
    exam_type: str,
    session: str,
    session_compact: str,
) -> list[dict]:
    cleaned = strip_noise_lines(raw)
    blocks = split_into_question_blocks(cleaned)
    out: list[dict] = []
    for b in blocks:
        q = parse_question_block(b, exam_type, session, session_compact)
        if q:
            out.append(q)
    return sorted(out, key=lambda x: x["question_number"])


def extract_pdf(path: Path) -> list[dict]:
    exam_type, session = parse_filename_meta(path)
    ymd = session.replace("-", "")
    raw = pdf_to_raw_text(path)
    return extract_questions_from_text(raw, exam_type, session, ymd)


def collect_pdf_paths(input_path: Path) -> list[Path]:
    if input_path.is_file():
        return [input_path]
    if not input_path.is_dir():
        raise FileNotFoundError(str(input_path))
    paths = sorted(
        p
        for p in input_path.iterdir()
        if p.suffix.lower() == ".pdf" and "교사용" in p.name and "1차" in p.name
    )
    if not paths:
        raise FileNotFoundError(f"No matching 교사용 1차 PDFs under {input_path}")
    return paths


def main() -> int:
    ap = argparse.ArgumentParser(description="Extract exam questions from 교사용 PDFs to JSON.")
    ap.add_argument("--input", required=True, type=Path, help="PDF file or directory containing PDFs")
    ap.add_argument("--output", type=Path, help="Write one merged JSON array of all questions (UTF-8)")
    ap.add_argument(
        "--output-dir",
        type=Path,
        help="Write one JSON file per PDF: {exam_session}.json (e.g. 2008-09-07.json)",
    )
    ap.add_argument("--dump-text", type=Path, help="If set, write raw extracted text (first PDF only if dir)")
    args = ap.parse_args()

    if args.output and args.output_dir:
        print("Use only one of --output or --output-dir.", file=sys.stderr)
        return 2

    paths = collect_pdf_paths(args.input)
    if args.dump_text:
        dump_path = args.dump_text
        dump_path.parent.mkdir(parents=True, exist_ok=True)
        dump_path.write_text(pdf_to_raw_text(paths[0]), encoding="utf-8")
        print(f"Wrote raw text dump: {dump_path}", file=sys.stderr)

    all_questions: list[dict] = []
    per_file_written = 0
    for p in paths:
        try:
            qs = extract_pdf(p)
        except ValueError as e:
            print(f"Skip {p.name}: {e}", file=sys.stderr)
            continue
        all_questions.extend(qs)
        nums = [q["question_number"] for q in qs]
        print(
            f"{p.name}: parsed {len(qs)} questions "
            f"(numbers {min(nums) if nums else '-'}–{max(nums) if nums else '-'})",
            file=sys.stderr,
        )
        if len(qs) != 120:
            print(f"  WARNING: expected 120 questions, got {len(qs)}", file=sys.stderr)

        if args.output_dir and qs:
            _, session = parse_filename_meta(p)
            args.output_dir.mkdir(parents=True, exist_ok=True)
            out_path = args.output_dir / f"{session}.json"
            out_path.write_text(json.dumps(qs, ensure_ascii=False, indent=2), encoding="utf-8")
            per_file_written += 1
            print(f"  -> {out_path}", file=sys.stderr)

    if args.output_dir:
        print(f"Wrote {per_file_written} JSON file(s) under {args.output_dir}", file=sys.stderr)
    elif args.output:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(
            json.dumps(all_questions, ensure_ascii=False, indent=2),
            encoding="utf-8",
        )
        print(f"Wrote {len(all_questions)} questions to {args.output}", file=sys.stderr)
    else:
        json.dump(all_questions, sys.stdout, ensure_ascii=False, indent=2)
        sys.stdout.write("\n")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
