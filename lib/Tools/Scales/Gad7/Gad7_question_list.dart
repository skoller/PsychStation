import 'package:flutter/material.dart';
import './Gad7_question_quant.dart';
import 'package:flutter_complete_guide/models/Gad7.dart';
import 'package:provider/provider.dart';


class Gad7QuestionList extends StatelessWidget {

Gad7QuestionList();

  @override
  Widget build(BuildContext context) {
    final gad7current = Provider.of<Gad7>(context);
    return 
    Expanded(
      flex: 1,
      child: ListView(
          children: <Widget>[
            Gad7QuestionQuant(0),
            Gad7QuestionQuant(1),
            Gad7QuestionQuant(2),
            Gad7QuestionQuant(3),
            Gad7QuestionQuant(4),
            Gad7QuestionQuant(5),
            Gad7QuestionQuant(6),
          ],
      ),
    );
  }
}
