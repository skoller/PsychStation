import 'package:flutter/material.dart';

class LocalResourcesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Local Resources"),
      ),
      body: Container(
       child: Text('these are the local resources'),
      ),
    );
  }
}