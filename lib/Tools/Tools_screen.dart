import 'package:flutter/material.dart';
import './tool_item.dart';

class ToolsScreen extends StatelessWidget {

  final tools = const [
    {
      'id': 't1',
      'title': 'Calculators',
    },
    {
      'id': 't2',
      'title': 'Scales',
    },
    {
      'id': 't3',
      'title': 'Landmark Studies',
    },
    {
      'id': 't4',
      'title': 'Clinical Guides',
    },
    {
      'id': 't5',
      'title': 'Local Resources',
    },
    {
      'id': 'c6',
      'title': 'Medications',
    },
    {
      'id': 't7',
      'title': 'DSM Guide',
    },
    {
      'id': 't8',
      'title': 'Primary Care for Psychiatrists',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Psych Station'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(25),
        children:
        (tools as List<Map<String, String>>).map( (tool) {
          return ToolItem(tool['id'], tool['title']);
        }).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
