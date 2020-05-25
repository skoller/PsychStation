import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// import './Gad7_question_quant.dart';

class Gad7Screen extends StatefulWidget {
  @override
  _Gad7ScreenState createState() => _Gad7ScreenState();
}

class _Gad7ScreenState extends State<Gad7Screen> {
  final Map<int, Widget> answerOptions = const <int, Widget>{
    0: Text('0'),
    1: Text('1'),
    2: Text('2'),
    3: Text('3'),
  };

  int qScore = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GAD7"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(18),
              child: Column(
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
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10 ),
              borderOnForeground: true,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text('Question Text'),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 0, bottom: 15, left: 10, right: 10),
                    child: CupertinoSegmentedControl<int>(
                      children: answerOptions,
                      onValueChanged: (int value) => {
                        setState(
                          () {
                            qScore = value;
                            print(qScore);
                          },
                        ),
                      },
                      groupValue: qScore,
                      unselectedColor: Colors.white,
                      selectedColor: Colors.blueGrey,
                    ),
                  ),
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10 ),
              borderOnForeground: true,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text('Question Text'),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 0, bottom: 15, left: 10, right: 10),
                    child: CupertinoSegmentedControl<int>(
                      children: answerOptions,
                      onValueChanged: (int value) => {
                        setState(
                          () {
                            qScore = value;
                            print(qScore);
                          },
                        ),
                      },
                      groupValue: qScore,
                      unselectedColor: Colors.white,
                      selectedColor: Colors.blueGrey,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// (answer_options as List).map((opt) => Text((answer_options[opt]).toString())).toList()

/// Gad7 and Gad7Q models in models folder
