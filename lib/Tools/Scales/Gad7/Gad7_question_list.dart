import 'package:flutter/material.dart';
import './Gad7_question_quant.dart';
import 'package:flutter_complete_guide/models/Gad7.dart';


class Gad7QuestionList extends StatelessWidget {
List<Map<String, Object>> gad7;

Gad7QuestionList(this.gad7);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: ListView(
          children: <Widget>[
            Gad7QuestionQuant(0, gad7),
            Gad7QuestionQuant(1, gad7),
            Gad7QuestionQuant(2, gad7),
            Gad7QuestionQuant(3, gad7),
            Gad7QuestionQuant(4, gad7),
            Gad7QuestionQuant(5, gad7),
            Gad7QuestionQuant(6, gad7),
          ],
      ),
    );
  }
}
