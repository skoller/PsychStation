import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:psychstation_application/models/Gad7_model.dart';
import 'package:provider/provider.dart';

class Gad7QuestionQuant extends StatelessWidget {
  int questionIndex;
  
  Gad7QuestionQuant(this.questionIndex);

  @override
  final Map<int, Widget> answerOptions = const <int, Widget>{
    0: Text('0'),
    1: Text('1'),
    2: Text('2'),
    3: Text('3'),
  };



  Widget build(BuildContext context) {
    final gad7pnt = Provider.of<Gad7model>(context);
    final gad7 = gad7pnt.questionScores;
    final gad7Qs = gad7pnt.questions;
   List<int> _updateQs(qI, gVal) {
     return gad7pnt.updateQuestionScores(qI, gVal);
    }
      var groupVal = gad7[questionIndex];
      print(gad7);
      print(gad7pnt.totalScore);
    // gad7pnt.updateQuestionScores();
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        borderOnForeground: true,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                gad7Qs[questionIndex],
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 0, bottom: 15, left: 10, right: 10),
              child: CupertinoSegmentedControl<int>(
                children: answerOptions,
                onValueChanged: (int value) => {
                 _updateQs(questionIndex, value),
                 groupVal = value
                  // gad7pnt.questionScores[widget.questionIndex] = value
                  // setState(
                  //   () {
                  //     gad7pnt.updateQuestionScores(widget.questionIndex, value);
                  //     gad7[widget.questionIndex] = value;
                  //     groupVal = gad7[widget.questionIndex];
                  //     print(gad7);
                  //     print(gad7.reduce((curr, next) => curr + next));
                  //   },
                  // ),
                },
                groupValue: groupVal,
                unselectedColor: Colors.white,
                selectedColor: Colors.blueGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
