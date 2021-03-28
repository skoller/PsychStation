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
  double _ideal_body_weight; //kg
  double _lean_body_weight; //kg
  var _lbUnit = false;
  var _bun;
  var _cr;
  var _inpatient = false;
  var _tcaCoadmin = false;
  var calcd = false;
  List<bool> _weightUnitSelection = [true, false];

  // List.generate(2, (_) => false);
  List<bool> _listLiSerumBools = List.generate(8, (_) => false);
  List<double> _listLiSerumValues = [0.5, 0.6, 0.7, 0.8, 0.9, 1.0, 1.1, 1.2];

  var _height; // cm
  var _inchUnit = false;
  var _inpatientValueZetin = 0.0;
  var _femaleValueZetin = 0.0;
  var _tcaValueZetin = 0.0;
  var cr_clearance;
  var li_clearance;

  // all calculations require height in cm and weight in kg
  // utilizes Hume formula for lean body mass:
  // Hume, R "Prediction of lean body mass from height and weight.". J Clin Pathol. 1966 Jul; 19(4):389-91.
  //Ideal body weight calculation:
  // Brassard, CL, Lohser, J, Donati, F, Bussières, JS Step-by-step clinical management of one-lung ventilation: Continuing professional development. Can J Anaesth 2014; 61:1103–21

  var _zetin_Result = e * 0.0;
  var _terao_Result = 0.0;
  var _abou_auda_Result = 0.0;
  var _pepin_Result = 0.0;

  void liDoseCalculate(String li, String age, bool female, String weight,
      String bun, String cr, String height) {
    setState(() {
//order of if statements intentional, as some values set impact later values
      if (_desiredLiSerumLevel) {
        _desiredLiSerumLevel = double.parse(li);
      }
      if (_age) {
        _age = double.parse(age);
      }
      if (_weight) {
        _weight = double.parse(weight);
      }
      if (_height) {
        _height = double.parse(weight);
      }
      if (_bun) {
        _bun = double.parse(bun);
      }
      if (_cr) {
        _cr = double.parse(cr);
      }
      if (_lbUnit) {
        _weight = (_weight / 2.2046227);
      }
      if (_inchUnit) {
        _height = (_height * 2.54);
      }
      if (female && _height) {
        _ideal_body_weight = (45.5 + (0.91 * (_height - 152.4)));
      }
      if ((female == false) && _height) {
        _ideal_body_weight = (50 + (0.91 * (_height - 152.4)));
      }
      if (_female && _height && _age && _cr) {
        cr_clearance = (((140 - _age) * _weight * 0.85) / (72 * _cr));
      }
      if ((_female == false) && _height && _age && _cr) {
        cr_clearance = (((140 - _age) * _weight) / (72 * _cr));
      }
      if (female && _height) {
        _lean_body_weight =
            ((0.29569 * _weight) + (0.41813 * _height) - 43.2933);
      }
      if ((female == false) && _height) {
        _lean_body_weight =
            ((0.32810 * _weight) + (0.33929 * _height) - 29.5336);
      }
      if (_height && _weight && cr_clearance) {
        li_clearance =
            (0.0093 * _lean_body_weight) + (0.0885 * cr_clearance * 0.06);
      }
      if (_inpatient) {
        _inpatientValueZetin = 1.0;
      }
      if (_inpatient == false) {
        _inpatientValueZetin = 0.0;
      }
      if (_female) {
        _femaleValueZetin = 1.0;
      }
      if (_female == false) {
        _femaleValueZetin = 0.0;
      }
      if (_tcaCoadmin) {
        _tcaValueZetin = 1.0;
      }
      if (_tcaCoadmin == false) {
        _tcaValueZetin = 0.0;
      }

//calc zetin below
      if (_weight != null &&
          _age != null &&
          _bun != null &&
          _desiredLiSerumLevel != null) {
        _zetin_Result = 0.0;
      }

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
      onChanged: () => {
        if (_desiredLiSerumLevel && _age && _weight && _height)
          {
            if (_formKey.currentState.validate())
              {
//perform calculation
                calcd = true,
                liDoseCalculate(
                    lilevelController.text,
                    ageController.text,
                    _female,
                    weightController.text,
                    bunController.text,
                    crController.text,
                    heightController.text)
                // If the form is valid, display a Snackbar.
                // Scaffold.of(context)
                //     .showSnackBar(SnackBar(content: Text('Processing Data')));
              },
          },
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Text("Desired Lithium Serum Level:"),
          ),
          Container(
            width: double.infinity,
            child: ToggleButtons(
              children: [
                Text("0.5"),
                Text("0.6"),
                Text("0.7"),
                Text("0.8"),
                Text("0.9"),
                Text("1.0"),
                Text("1.1"),
                Text("1.2")
              ],
              highlightColor: Theme.of(context).accentColor,
              isSelected: _listLiSerumBools,
              onPressed: (int index) {
                setState(() {
                  for (int buttonIndex = 0;
                      buttonIndex < _listLiSerumBools.length;
                      buttonIndex++) {
                    if (buttonIndex == index) {
                      _listLiSerumBools[buttonIndex] = true;
                    } else {
                      _listLiSerumBools[buttonIndex] = false;
                    }
                    _desiredLiSerumLevel = _listLiSerumValues[index];
                  }
                  // _weightUnitSelection[index] = !_weightUnitSelection[index];
                });
              },
            ),
          ),
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
          Row(
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  key: ValueKey('Weight'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter weight.';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "  Weight:",
                    // labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  controller: weightController,
                  // onChanged: (value) {
                  //     _weight = value;
                  //     print(_weight);
                  //   },
                ),
              ),
              ToggleButtons(
                children: [Text("kg"), Text("lb")],
                highlightColor: Theme.of(context).accentColor,
                isSelected: _weightUnitSelection,
                onPressed: (int index) {
                  setState(() {
                    for (int buttonIndex = 0;
                        buttonIndex < _weightUnitSelection.length;
                        buttonIndex++) {
                      if (buttonIndex == index) {
                        _weightUnitSelection[buttonIndex] = true;
                      } else {
                        _weightUnitSelection[buttonIndex] = false;
                      }
                      _lbUnit = _weightUnitSelection[1];
                    }
                    // _weightUnitSelection[index] = !_weightUnitSelection[index];
                  });
                },
              )
            ],
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
              labelText: "  Height:",
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
