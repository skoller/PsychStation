import 'package:flutter/material.dart';
import './Scales_list_item.dart';

final scales = const [
    {
      'id': 's1',
      'title': 'PHQ9',
    },
    {
      'id': 's2',
      'title': 'GAD7',
    },
  ];

class ScalesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculators"),
      ),
      body: Container(
        child: Column(children: [
          ScalesListItem(scales[0]['id'], scales[0]['title']),
          ScalesListItem(scales[1]['id'], scales[1]['title']),
        ]),
      ),
    );
  }
}