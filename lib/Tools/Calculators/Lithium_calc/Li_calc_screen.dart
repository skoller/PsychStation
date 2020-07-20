import 'package:flutter/material.dart';
import './LiForm.dart';

class LiCalcScreen extends StatefulWidget {
  @override
  _LiCalcScreenState createState() => _LiCalcScreenState();
}

class _LiCalcScreenState extends State<LiCalcScreen> {

  @override
  // final weightController = TextEditingController();
  // final ageController = TextEditingController();
  // final bunController = TextEditingController();
  // var age;
  // var weight;
  // var bun;

  // final _formKey = GlobalKey<FormState>();

  // double zetin(String age, String weight) {
  //   var _age = int.parse(age);
  //   var _weight = double.parse(weight);
  //   return (_age + _weight);
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lithium Dose Calculator"),
      ),
      body: Container(
        child: LiForm())
    );
  }
}
