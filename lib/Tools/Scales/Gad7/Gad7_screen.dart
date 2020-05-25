import 'package:flutter/material.dart';
import './Gad7_question_quant.dart';

class Gad7Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GAD7"),
      ),
      body: Container(
        child: Column(children: <Widget>[Gad7QuestionQuant()]),
      ),
    );
  }
}


/// Gad7 and Gad7Q models in models folder