import 'package:flutter/material.dart';

class LiCalcScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lithium Dose Calculator"),
      ),
      body: Container(
       child: Text('this is the li calculator'),
      ),
    );
  }
}