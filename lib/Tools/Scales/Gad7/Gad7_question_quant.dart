import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_complete_guide/models/Gad7.dart';

class Gad7QuestionQuant extends StatefulWidget {
  int questionIndex;
  List<Map<String, Object>> qANDa;


  Gad7QuestionQuant(this.questionIndex, this.qANDa);

  @override
  _Gad7QuestionQuantState createState() => _Gad7QuestionQuantState();
}

class _Gad7QuestionQuantState extends State<Gad7QuestionQuant> {


  final Map<int, Widget> answerOptions = const <int, Widget>{
    0: Text('0'),
    1: Text('1'),
    2: Text('2'),
    3: Text('3'),
  };

  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
      child: Card(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10 ),
              borderOnForeground: true,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(widget.qANDa[widget.questionIndex]['q'],),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 0, bottom: 15, left: 10, right: 10),
                    child: CupertinoSegmentedControl<int>(
                      children: answerOptions,
                      onValueChanged: (int value) => {
                        setState(
                          () {
                            widget.qANDa[widget.questionIndex]['a'] = value;
                            print(widget.qANDa);
                          },
                        ),
                      },
                      groupValue: widget.qANDa[widget.questionIndex]['a'],
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