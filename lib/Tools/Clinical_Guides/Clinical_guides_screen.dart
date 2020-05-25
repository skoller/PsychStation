import 'package:flutter/material.dart';

class ClinicalGuidesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Clinical Guides"),
      ),
      body: Container(
       child: Text('these are the clinical guides'),
      ),
    );
  }
}