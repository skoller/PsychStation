import 'package:flutter/material.dart';

class Gad7 with ChangeNotifier {
  // List<Gad7Item> _items = [];

  // List<Gad7Item> get items {
  //   return [..._items];
  // }

// void updateGad7ItemScore

  List<String> _questions = [
    "Feeling nervous, anxious, or on edge",
    "Not being able to stop or control worrying",
    "Worrying too much about different things",
    "Trouble relaxing",
    "Being so restless that it's hard to sit still",
    "Becoming easily annoyed or irritable",
    "Feeling afraid as if something awful might happen",
  ];
  List<int> _questionScores = [0, 0, 0, 0, 0, 0, 0];
  int _totalScore = 0;

  List<int> get questionScores {
    return [..._questionScores];
  }

  List<String> get questions{
    return [..._questions];
  }

  int get totalScore {
    return _totalScore;
  }

  int updateTotalScore() {
    var qs = _questionScores;
    _totalScore = qs.reduce((curr, next) => curr + next);
    notifyListeners();
    return _totalScore;
  }

 List<int> updateQuestionScores(index, val) {
    _questionScores[index] = val;
    notifyListeners();
    return _questionScores;
  }
}
