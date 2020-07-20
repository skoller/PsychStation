import 'package:flutter/material.dart';

class LiForm extends StatefulWidget {
  @override
  LiFormState createState() {
    return LiFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class LiFormState extends State<LiForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
final weightController = TextEditingController();
  final ageController = TextEditingController();
  final bunController = TextEditingController();

   var age;
  var weight;
  var bun;

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
              key: ValueKey('Age'),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter age.';
                }
               
                return null;
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "  Age:",
                // labelStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
              controller: ageController,
               onChanged: (value) {
                    age = value;
                    print(age);
                  },
            ),
            TextFormField(
              key: ValueKey('Weight'),
              // validator: (value) {
              //   if (value.isEmpty || !value.contains('@')) {
              //     return 'Please enter a valid email address.';
              //   }
              //   return null;
              // },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "  Weight (kg):",
                // labelStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
              controller: weightController,
              // onChanged: (value) {
              //     _weight = value;
              //     print(_weight);
              //   },
            ),
            TextFormField(
              key: ValueKey('Bun'),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "  BUN (mg/dL):",
                // labelStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
              controller: bunController,
              // onChanged: (value) {
              //     _bun = value;
              //     print(_bun);
              //   },
            ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false
                // otherwise.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a Snackbar.
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}










// Card(
//         elevation: 5,
//         child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
//           Card(
//             elevation: 5,
//             child: TextFormField(
//               key: ValueKey('Age'),
//               validator: (value) {
//                 if (value.isEmpty) {
//                   return 'Please enter age.';
//                 }
//                 return null;
//               },
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(
//                 labelText: "  Age:",
//                 // labelStyle: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               controller: ageController,
//               //  onChanged: (value) {
//               //       _age = value;
//               //       print(_age);
//               //     },
//             ),
//           ),
//           Card(
//             elevation: 5,
//             child: TextFormField(
//               key: ValueKey('Weight'),
//               // validator: (value) {
//               //   if (value.isEmpty || !value.contains('@')) {
//               //     return 'Please enter a valid email address.';
//               //   }
//               //   return null;
//               // },
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(
//                 labelText: "  Weight (kg):",
//                 // labelStyle: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               controller: weightController,
//               // onChanged: (value) {
//               //     _weight = value;
//               //     print(_weight);
//               //   },
//             ),
//           ),
//           Card(
//             elevation: 5,
//             child: TextFormField(
//               key: ValueKey('Bun'),
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(
//                 labelText: "  BUN (mg/dL):",
//                 // labelStyle: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               controller: bunController,
//               // onChanged: (value) {
//               //     _bun = value;
//               //     print(_bun);
//               //   },
//             ),
//           ),
//           Container(
//               padding: EdgeInsets.all(5),
//               child: Column(children: [
//                 RaisedButton(
//                     textColor: Colors.white,
//                     child: Text('calculate'),
//                     onPressed: () {
//                       if (ageController.text != null) {
//                         if (int.tryParse(ageController.text) != null) {
//                           age = ageController.text;
//                           print(age);
//                         } else {
//                           age = 0;
//                           print("age parse error");
//                         }
//                       } else {
//                         age = 0;
//                         print("age is null");
//                       }
//                       // weightController.text
//                     }),
//                 // Text("${zetin(ageController.text, weightController.text)}"),
//                 Text("The Result:"),
//                 Text("The Result:"),
//                 Text("The Result:")
//               ]))
//         ]),
//       ),