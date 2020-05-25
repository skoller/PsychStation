import 'package:flutter/material.dart';

class MedicationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Medications"),
      ),
      body: Container(
       child: Text('these are the medications'),
      ),
    );
  }
}