// import "package:flutter/material.dart";
// import "package:hive/hive.dart";
// import '../models/PatientModel.dart';
// import './new_patient_input_widget.dart';

// class NewPatientForm extends StatefulWidget {
//   @override
//   _NewPatientFormState createState() => _NewPatientFormState();
// }

// class _NewPatientFormState extends State<NewPatientForm> {
//   final _formKey = GlobalKey<FormState>();

//   String _ptIdentifier;
//   String _archivedStatus;

//   void addPatient(PatientModel patientModel) {
//     final patientsBox = Hive.box('patients');
//     patientsBox.add(patientModel);
//   }
  
  
  
//   @override
//   Widget build(BuildContext context) {
//     return NewPatientInput();
//   }
// }