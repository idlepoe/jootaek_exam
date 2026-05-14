#!/usr/bin/env python3
"""
assets/jsons 아래 시험 회차 JSON에서 question_text와 choices[].text만 모아
하나의 Markdown 파일로보냅니다.
"""

from __future__ import annotations

import json
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
JSON_DIR = ROOT / "assets" / "jsons"
OUTPUT_MD = JSON_DIR / "question_text_choices.md"

# 회차별 문항 JSON만 대상 (manifest 등 제외)
SESSION_JSON = re.compile(r"^\d{4}-\d{2}-\d{2}\.json$")


def load_questions(path: Path) -> list[dict]:
    raw = path.read_text(encoding="utf-8")
    data = json.loads(raw)
    if not isinstance(data, list):
        return []
    return [x for x in data if isinstance(x, dict)]


def choice_texts(item: dict) -> list[str]:
    choices = item.get("choices")
    if not isinstance(choices, list):
        return []
    out: list[str] = []
    for c in choices:
        if isinstance(c, dict) and "text" in c:
            t = c.get("text")
            if isinstance(t, str):
                out.append(t)
    return out


def main() -> None:
    files = sorted(
        p for p in JSON_DIR.iterdir() if p.is_file() and SESSION_JSON.match(p.name)
    )
    lines: list[str] = [
        "# question_text 및 선지 텍스트 추출",
        "",
        f"원본 디렉터리: `assets/jsons/`",
        f"회차 JSON 파일 수: {len(files)}",
        "",
    ]

    for path in files:
        items = load_questions(path)
        lines.append(f"## {path.name}")
        lines.append("")

        for i, item in enumerate(items, start=1):
            qtext = item.get("question_text")
            if not isinstance(qtext, str):
                qtext = ""

            lines.append(f"### 문항 {i}")
            lines.append("")
            lines.append(qtext.strip())
            lines.append("")

            for j, ctext in enumerate(choice_texts(item), start=1):
                lines.append(f"{j}. {ctext.strip()}")
            lines.append("")

    OUTPUT_MD.write_text("\n".join(lines), encoding="utf-8")
    print(f"Wrote {OUTPUT_MD} ({len(lines)} lines)")


if __name__ == "__main__":
    main()
