class QuestionModel {
  String question;
  bool answersTF;
  String reanswer;

  QuestionModel({this.question, this.answersTF, this.reanswer});

  void setQuestion(String getQuestion) {
    question = getQuestion;
  }

  void setAnswer(bool getAnswer) {
    answersTF = getAnswer;
  }

  void setReAnswer(String getReAnswer) {
    reanswer = getReAnswer;
  }

  String getReAnswer() {
    return reanswer;
  }

  String getQuestion() {
    return question;
  }

  bool getAnswer() {
    return answersTF;
  }
}
