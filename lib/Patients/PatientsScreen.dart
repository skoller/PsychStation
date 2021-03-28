// import "package:flutter/material.dart";
// import 'package:flutter_complete_guide/LocalData/PsLocalDatabase.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import './new_patient_input_widget.dart';

// class PatientsScreen extends StatefulWidget {
//   @override
//   _PatientsScreenState createState() => _PatientsScreenState();
// }

// class _PatientsScreenState extends State<PatientsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Patients'),
//         ),
//         body: Column(
//           children: <Widget>[
//             Expanded(child: _buildPatientList(context)),
//             // NewPatientInput(),
//           ],
//         ));
//   }

//   StreamBuilder<List<Patient>> _buildPatientList(BuildContext context) {
//     final localDatabase = Provider.of<PsLocalDb>(context);
//     return StreamBuilder(
//       stream: localDatabase.watchAllPatients(),
//       builder: (context, AsyncSnapshot<List<Patient>> snapshot) {
//         final patients = snapshot.data ?? List();

//         return ListView.builder(
//           itemCount: patients.length,
//           itemBuilder: (_, index) {
//             final itemPatient = patients[index];
//             return _buildPatientListItem(itemPatient, localDatabase);
//           },
//         );
//       },
//     );
//   }

//   Widget _buildPatientListItem(Patient itemPt, PsLocalDb database) {
//     return Slidable(actionPane: SlidableDrawerActionPane(),
//     secondaryActions: <Widget>[IconSlideAction(caption: 'Delete', color: Colors.red, icon: Icons.delete, onTap: () => database.deletePatient(itemPt))],
//     child: CheckboxListTile(title: Text('${itemPt.ptName}'), subtitle: Text('${itemPt.dateCreated}'), value: itemPt.archived, onChanged: (newVal) {database.updatePatient(itemPt.copyWith(archived: newVal));}));
//   }


// }

// import "package:flutter/material.dart";
// import "package:hive/hive.dart";
// import './PatientList.dart';

// class PatientsScreen extends StatefulWidget {
//   @override
//   _PatientsScreenState createState() => _PatientsScreenState();
// }

// class _PatientsScreenState extends State<PatientsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: FutureBuilder(future: Hive.openBox('patients'), 
//       builder: (BuildContext context, AsyncSnapshot snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           if (snapshot.hasError)
//             return Text(snapshot.error.toString());
//           else {}
//             return PatientList();
//         } else
//           return Scaffold();
//         },
//       ),
//     );
    
//   }
// }