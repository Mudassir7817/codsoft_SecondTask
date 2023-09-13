class Model {
  Model({
    required this.subname,
    required this.iscompleted,
    required this.score,
    required this.questions,
  });
  late final String subname;
  late final bool iscompleted;
  late final int score;
  late final List<QuestionsModel> questions;

  Model.fromJson(Map<String, dynamic> json) {
    subname = json['subname'];
    iscompleted = json['iscompleted'];
    score = json['score'];
    questions = List.from(json['questions'])
        .map((e) => QuestionsModel.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['subname'] = subname;
    _data['iscompleted'] = iscompleted;
    _data['score'] = score;
    _data['questions'] = questions.map((e) => e.toJson()).toList();
    return _data;
  }
}

class QuestionsModel {
  QuestionsModel({
    required this.question,
    required this.options,
    required this.correctAnswer,
  });
  late final String question;
  late final List<String> options;
  late final String correctAnswer;

  QuestionsModel.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    options = List.castFrom<dynamic, String>(json['options']);
    correctAnswer = json['correctAnswer'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['question'] = question;
    _data['options'] = options;
    _data['correctAnswer'] = correctAnswer;
    return _data;
  }
}
