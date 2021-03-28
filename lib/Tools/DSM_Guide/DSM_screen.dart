import 'package:flutter/material.dart';
import './DSM_section.dart';

class DsmScreen extends StatelessWidget {

final dsmSection = const [
   {
      'id': 'd1',
      'title': 'Neurodevelopmental Disorders',
    },
    {
      'id': 'd2',
      'title': 'Schizophrenia Spectrum and Other Psychotic Disorders',
    },
    {
      'id': 'd3',
      'title': 'Bipolar and Related Disorders',
    },
    {
      'id': 'd4',
      'title': 'Depressive Disorders',
    },
    {
      'id': 'd5',
      'title': 'Anxiety Disorders',
    },
    {
      'id': 'd6',
      'title': 'Obsessive-Compulsive and Related Disorders',
    },
    {
      'id': 'd7',
      'title': 'Trauma- and Stressor-Related Disorders',
    },
    {
      'id': 'd8',
      'title': 'Dissociative Disorders',
    },
    {
      'id': 'd9',
      'title': 'Somatic Symptom and Related Disorders',
    },
    {
      'id': 'd10',
      'title': 'Feeding and Eating Disorders',
    },
    {
      'id': 'd11',
      'title': 'Elimination Disorders',
    },
    {
      'id': 'd12',
      'title': 'Sleep-Wake Disorders',
    },
    {
      'id': 'd13',
      'title': 'Sexual Dysfunctions',
    },
    {
      'id': 'd14',
      'title': 'Gender Dysphoria',
    },
    {
      'id': 'd15',
      'title': 'Disruptive, Impulse-Control, and Conduct Disorders',
    },
    {
      'id': 'd16',
      'title': 'Substance-Related and Addictive Disorders',
    },
    {
      'id': 'd17',
      'title': 'Neurocognitive Disorders',
    },
    {
      'id': 'd18',
      'title': 'Personality Disorders',
    },
    {
      'id': 'd19',
      'title': 'Paraphilic Disorders',
    },
    {
      'id': 'd20',
      'title': 'Other Mental Disorders and Additional Codes',
    },
    {
      'id': 'd21',
      'title': 'Medication-Induced Movement Disorders and Other Adverse Effects of Medication',
    },
    {
      'id': 'd22',
      'title': 'Other Conditions That May Be a Focus of Clinical Attention',
    },
];

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DSM Sections'),),
      body: ListView(
        padding: const EdgeInsets.all(25),
        children:
        (dsmSection).map( (section) {
          return DSM_section(section['id'], section['title']);
        }).toList(),
      ),
    );
  }
}