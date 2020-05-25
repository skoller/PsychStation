import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// import './Gad7_question_quant.dart';
import './Gad7_question_list.dart';
import 'package:flutter_complete_guide/models/Gad7.dart';

class Gad7Screen extends StatefulWidget {
  @override
  _Gad7ScreenState createState() => _Gad7ScreenState();
}

class _Gad7ScreenState extends State<Gad7Screen> {
  var gad7 = [ {"q": "Feeling nervous, anxious, or on edge", "a": 0},
    {"q": "Not being able to stop or control worrying", "a": 0},
    {"q": "Worrying too much about different things", "a": 0},
    {"q": "Trouble relaxing", "a": 0},
    {"q": "Being so restless that it's hard to sit still", "a": 0},
    {"q": "Becoming easily annoyed or irritable", "a": 0},
    {"q": "Feeling afraid as if something awful might happen", "a": 0}
  ];

  // int _totalScoreGad7() {
  //   setState(
  //     () {
  //       gad7model.totalScore = gad7model.questionScores.fold(0, (previousValue, currentValue) => previousValue + currentValue);
  //     },
  //   );
  // }

  // final GAD7qANDa = [
  //   {"q": "Feeling nervous, anxious, or on edge", "a": 0},
  //   {"q": "Not being able to stop or control worrying", "a": 0},
  //   {"q": "Worrying too much about different things", "a": 0},
  //   {"q": "Trouble relaxing", "a": 0},
  //   {"q": "Being so restless that it's hard to sit still", "a": 0},
  //   {"q": "Becoming easily annoyed or irritable", "a": 0},
  //   {"q": "Feeling afraid as if something awful might happen", "a": 0}
  // ];

  @override
  Widget build(BuildContext context) {
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
                    padding: EdgeInsets.only(left: 50),
                    child: Text('Total Score: '),
                  ),
                ],
              ),
            ),
            Gad7QuestionList(gad7),
          ],
        ),
      ),
    );
  }
}

// (answer_options as List).map((opt) => Text((answer_options[opt]).toString())).toList()
