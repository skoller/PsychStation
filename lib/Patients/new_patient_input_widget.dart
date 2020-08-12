import 'package:flutter/material.dart';
// import 'package:flutter/semantics.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_complete_guide/LocalData/PsLocalDatabase.dart';
import 'NewPatientForm.dart';


class NewPatientInput extends StatefulWidget {
  const NewPatientInput({Key key,}) : super(key: key);

  @override
  _NewPatientInputState createState() => _NewPatientInputState();
}

class _NewPatientInputState extends State<NewPatientInput> {
DateTime newPatientCreatedDate;
TextEditingController controller;

@override
Widget build(BuildContext context) {
  controller = TextEditingController();
  return Container(
    padding: const EdgeInsets.all(8.0),
    child: Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
      _buildTextField(context),
      _buildDateButton(context),
    ],
    ),
    );
}

Expanded _buildTextField(BuildContext context) {
  return Expanded(child: TextFormField(
    controller: controller,
    decoration: InputDecoration(hintText: 'Pt Indetifier'),
    onChanged: (inputName) {
      // final database = Provider.of<PsLocalDb>(context);
      // final pt = Patient(
      //   ptName: inputName,
      //   // dateCreated: DateTime.now(),
      //   archived: false);
      // database.insertPatient(pt);
      // // resetValuesAfterSubmit();
    },
   ),
 );
}

IconButton _buildDateButton(BuildContext context) {
  return IconButton(icon: Icon(Icons.calendar_today), onPressed: () async {
    newPatientCreatedDate = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1920), lastDate: DateTime(2050),);
  },);
}

void resetValuesAfterSubmit() {
  setState(() {
    newPatientCreatedDate = null;
    controller.clear();
  });
}

}
