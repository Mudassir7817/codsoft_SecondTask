import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Screens/QuestionsScreen.dart';

class Questions extends ChangeNotifier {
  late List questionList;
  QueryDocumentSnapshot? document;
  bool quizCompleted = false;
  int currentQuestion = 0;

  void setDocument(QueryDocumentSnapshot doc) {
    document = doc;
    questionList = document!['questions'];
  }

  String getCurrentQuestion() {
    if (currentQuestion < questionList.length) {
      return questionList[currentQuestion];
    } else if (!quizCompleted) {
      // Only execute the completion logic once
      quizCompleted = true;
      _completeQuiz();
    }
    return 'You Have Completed The quiz\n Your Score: $score';
  }

  void _completeQuiz() {
    document?.reference.update({'iscompleted': true}).then((value) {
      calculateScore();
      notifyListeners();
      score;
    });
  }

  void moveToNextQuestion() {
    if (currentQuestion <= questionList.length - 1) {
      currentQuestion++;
      notifyListeners();
    }
  }

  void calculateScore() {
    List optionlist = document?['Options'];
    for (var i = 0; i < optionlist.length; i++) {
      if (optionlist[i].toLowerCase() == usersanswers[i].toLowerCase()) {
        score++;
        log('$optionlist');
      }
    }
    document?.reference.update({'Score': score});
  }
}
