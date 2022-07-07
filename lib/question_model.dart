class Question {
  final String questionText;
  final List<Answer> answerList;
  Question(this.questionText, this.answerList);
}

class Answer {
  final String answerText;
  final bool isCorrect;
  Answer(this.answerText, this.isCorrect);
}

List<Question> getQuestions() {
  List<Question> list = [];
  list.add(Question("Ca .... hoa Rong", [
    Answer("Chuoi", false),
    Answer("Me", false),
    Answer("Chep", true),
    Answer("Map", false),
  ]));
  list.add(Question("Khon .... dai cho", [
    Answer("nha", true),
    Answer("vat", false),
    Answer("the", false),
    Answer("truong", false),
  ]));
  list.add(Question("gay ong ... lung ong", [
    Answer("dap", true),
    Answer("roi", false),
    Answer("danh", false),
    Answer("danh", false),
  ]));
  list.add(Question("nuoi ... tay ao", [
    Answer("ran", false),
    Answer("ong", true),
    Answer("meo", false),
    Answer("lon", false),
  ]));
  list.add(Question("an qua nho ke ....", [
    Answer("cho qua", false),
    Answer("mua qua", false),
    Answer("bon phan", false),
    Answer("trong cay", true),
  ]));

  return list;
}
