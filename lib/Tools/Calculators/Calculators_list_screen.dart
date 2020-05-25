import 'package:flutter/material.dart';
import './Calculators_list_item.dart';

class CalculatorsListScreen extends StatelessWidget {
  
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
          CalculatorsListItem(calcs[0]['id'], calcs[0]['title']),
          CalculatorsListItem(calcs[1]['id'], calcs[1]['title']),
        ]),
      ),
    );
  }
}
