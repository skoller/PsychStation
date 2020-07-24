import 'package:flutter/material.dart';
import 'dart:math';

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
  final crController = TextEditingController();
  final lilevelController = TextEditingController();
  final heightController = TextEditingController();

  var _desiredLiSerumLevel;
  var _age;
  bool _female = false;
  var _weight; //kg
  var _bun;
  var _cr;
  var _inpatient = false;
  var _tcaCoadmin = false;
  var calcd = false;
  double _ideal_body_weight = 0.0;
  double _lean_body_weight = 0.0;
  var _height; // cm

  var cr_clearance;
  var li_clearance;


  var _zetin_Result = e * 0.0;
  var _terao_Result = 0.0;
  var _abou_auda_Result = 0.0;
  var _pepin_Result = 0.0;

  void liDoseCalculate(String li, String age, bool female, String weight,
      String bun, String cr, String height) {
    setState(() {
      if (_desiredLiSerumLevel) { _desiredLiSerumLevel = double.parse(li);}
      if (_age) { _age = double.parse(age);}
      if (_weight) { _weight = double.parse(weight);}
      if (_height) { _height = double.parse(weight);}
      if (_bun) { _bun = double.parse(bun);}
      if (_cr) { _cr = double.parse(cr);}
      if (female && _height) { _ideal_body_weight = (45.5+(0.91*(_height-152.4)));}
      if ((female == false) && _height) { _ideal_body_weight = (50+(0.91*(_height-152.4))); }
      if (_female && _height && _age && _cr) {cr_clearance = (((140 - _age) * _weight * 0.85) / (72 * _cr));}
      if ((_female == false) && _height && _age && _cr) {cr_clearance = (((140 - _age) * _weight) / (72 * _cr));}
      if (female && _height) { _lean_body_weight = ((0.29569*_weight) + (0.41813*_height) - 43.2933);}
      if ((female == false) && _height) { _lean_body_weight = ((0.32810*_weight) + (0.33929*_height) - 29.5336);}
      if (_height &&  _weight && cr_clearance) {li_clearance = (0.0093*_lean_body_weight)+(0.0885*cr_clearance*0.06);}

     



//calc zetin below
      if (
        _weight != null &&
        _age != null &&
        _bun != null &&
        _desiredLiSerumLevel != null) 
          {_zetin_Result = 0.0;}
      
      _terao_Result = 0.0;
      _pepin_Result = 0.0;

      if (female) {
        _abou_auda_Result = 382.54 +
            (348.29 * _desiredLiSerumLevel) +
            (67.19 * (((140 - _age) * _weight * 0.85) / (72 * _cr)) * 0.06);
            print("female");
      } else {
        _abou_auda_Result = 382.54 +
            (348.29 * _desiredLiSerumLevel) +
            (67.19 * (((140 - _age) * _weight) / (72 * _cr)) * 0.06);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            key: ValueKey('Desired Li Serum Level'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter a desired serum Li level.';
              }

              return null;
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "  Desired Serum Li Level:",
              // labelStyle: TextStyle(fontWeight: FontWeight.bold),
            ),
            controller: lilevelController,
            // onChanged: (value) {
            //   _desiredLiSerumLevel = value;
            //   print(_desiredLiSerumLevel);
            // },
          ),
          TextFormField(
            key: ValueKey('Cr'),
            // validator: (value) {
            //   if (value.isEmpty) {
            //     return 'Please enter Creatinine.';
            //   }

            //   return null;
            // },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "  Cr:",
              // labelStyle: TextStyle(fontWeight: FontWeight.bold),
            ),
            controller: crController,
            // onChanged: (value) {
            //   _cr = value;
            //   print(_cr);
            // },
          ),
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
            // onChanged: (value) {
            //   _age = value;
            //   print(_age);
            // },
          ),
          TextFormField(
            key: ValueKey('Weight'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter weight.';
              }
              return null;
            },
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
            key: ValueKey('Height'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter height.';
              }
              return null;
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "  Height (cm):",
              // labelStyle: TextStyle(fontWeight: FontWeight.bold),
            ),
            controller: heightController,
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
          Container(
            padding: EdgeInsets.only(right: 100),
            child: CheckboxListTile(
                key: ValueKey('sex'),
                title: const Text('Female'),
                value: _female,
                onChanged: (val) {
                  setState(() {
                     _female = val;
                  });
                  print(_female);
                }),
          ),
          Container(
            padding: EdgeInsets.only(right: 100),
            child: CheckboxListTile(
                key: ValueKey('Inpt'),
                title: const Text('Inpatient'),
                value: _inpatient,
                onChanged: (val) {
                  setState(() {
                     _inpatient = val;
                  });
                   print(_inpatient);
                }),
          ),
          Container(
            padding: EdgeInsets.only(right: 100),
            child: CheckboxListTile(
                key: ValueKey('tca'),
                title: const Text('TCA Co-administration'),
                value: _tcaCoadmin,
                onChanged: (val) {
                  setState(() {
                     _tcaCoadmin = val;
                  });
                  print(_tcaCoadmin);
                }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false
                // otherwise.
                if (_formKey.currentState.validate()) {
//perform calculation
                  calcd = true;
                  liDoseCalculate(
                      lilevelController.text,
                      ageController.text,
                      _female,
                      weightController.text,
                      bunController.text,
                      crController.text,
                      heightController.text);
                  // If the form is valid, display a Snackbar.
                  // Scaffold.of(context)
                  //     .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              },
              child: Text('Calculate'),
            ),
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.topCenter,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                      "Zetin et al: ${(calcd == true) ? (_zetin_Result.toStringAsFixed(0) + " mg/day") : " "}"),
                  Text(
                      "Terao et al: ${(calcd == true) ? (_terao_Result.toStringAsFixed(0) + " mg/day") : " "}"),
                  Text(
                      "Pepin et al: ${(calcd == true) ? (_pepin_Result.toStringAsFixed(0) + " mg/day") : " "}"),
                  Text(
                      "Abou-Auda et al: ${(calcd == true) ? (_abou_auda_Result.toStringAsFixed(1) + " mg/day") : " "}")
                ]),
          ),
          SizedBox(height: 50, width: double.infinity)
        ],
      ),
    );
  }
}
