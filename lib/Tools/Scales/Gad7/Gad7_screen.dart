import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// import './Gad7_question_quant.dart';
import './Gad7_question_list.dart';
import 'package:psychstation_application/models/Gad7_model.dart';
import 'package:provider/provider.dart';

class Gad7Screen extends StatelessWidget {
  var gad7qs = [
    {"q": "Feeling nervous, anxious, or on edge", "a": 0},
    {"q": "Not being able to stop or control worrying", "a": 0},
    {"q": "Worrying too much about different things", "a": 0},
    {"q": "Trouble relaxing", "a": 0},
    {"q": "Being so restless that it's hard to sit still", "a": 0},
    {"q": "Becoming easily annoyed or irritable", "a": 0},
    {"q": "Feeling afraid as if something awful might happen", "a": 0}
  ];

  @override
  Widget build(BuildContext context) {
    final gad7current = Provider.of<Gad7model>(context);
    final totScore = gad7current.totalScore;
    int _score() {
      return gad7current.updateTotalScore();
    }

    // gad7current.updateTotalScore();
    // print(gad7current.totalScore);
    // final gad7totalScore = gad7pnt;
    return Scaffold(
      appBar: AppBar(
        title: Text("GAD7"),
      ),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: double.infinity,
              padding:
                  EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Question Key: ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("0 = Not At All"),
                      Text("1 = Several Days"),
                      Text("2 = More than Half the Days"),
                      Text("3 = Nearly Every Day"),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 40),
                    child: Text("Total Score: ${_score().toString()}"),
                  ),
                ],
              ),
            ),
            Gad7QuestionList(),
          ],
        ),
      ),
    );
  }
}

// (answer_options as List).map((opt) => Text((answer_options[opt]).toString())).toList()
