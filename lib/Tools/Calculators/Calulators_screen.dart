import 'package:flutter/material.dart';
import './Calculator_item.dart';

class CalculatorsScreen extends StatelessWidget {
  
  final calcs = const [
    {
      'id': 'calc1',
      'title': 'Lithium Dose Calculator',
    },
    {
      'id': 'calc2',
      'title': 'Benzodiazepine Dose Calculator',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculators"),
      ),
      body: Container(
        child: Column(children: [
          CalculatorItem(calcs[0]['id'], calcs[0]['title']),
          CalculatorItem(calcs[1]['id'], calcs[1]['title']),
        ]),
      ),
    );
  }
}
