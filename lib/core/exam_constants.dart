const examRawRepoBase =
    'https://raw.githubusercontent.com/idlepoe/jootaek_exam/main';

const examSubjects = ['민법', '회계원리', '공동주택시설개론'];

String examJsonUrl(String examSession) =>
    '$examRawRepoBase/assets/jsons/${Uri.encodeComponent(examSession)}.json';

String examSessionsManifestUrl() =>
    '$examRawRepoBase/assets/jsons/exam-sessions.json';

String examQuestionImageUrl(String questionId) =>
    '$examRawRepoBase/assets/images/${Uri.encodeComponent(questionId)}.png';

String examChoiceImageUrl(String questionId, int choiceNo) =>
    '$examRawRepoBase/assets/images/${Uri.encodeComponent(questionId)}_$choiceNo.png';
