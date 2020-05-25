import './Tools/Tools_screen.dart';
import './Tools/Calculators/Calulators_screen.dart';
import './Tools/Scales/Scales_screen.dart';
import './Tools/Landmark_Studies/Landmark_studies_screen.dart';
import './Tools/Clinical_Guides/Clinical_guides_screen.dart';
import './Tools/Local_Resources/Local_resources_screen.dart';
import './Tools/Medications/Medications_screen.dart';
import './Tools/DSM_Guide/DSM_guide_screen.dart';
import './Tools/Primary_Care_For_Psychiatrists/Primary_care_for_psychiatrists_screen.dart';


import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Psych Station',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        accentColor: Colors.blue,
        canvasColor: Colors.grey[100],
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline1: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      home: ToolsScreen(),
      routes: {
        '/tools': (cntx) => ToolsScreen(),
        '/tools/calculators': (cntx) => CalculatorsScreen(),
        '/tools/scales': (cntx) => ScalesScreen(),
        '/tools/landmark_studies': (cntx) => LandmarkStudiesScreen(),
        '/tools/clinical_guides': (cntx) => ClinicalGuidesScreen(),
        '/tools/local_resources': (cntx) => LocalResourcesScreen(),
        '/tools/medications': (cntx) => MedicationsScreen(),
        '/tools/DSM_guide': (cntx) => DSMGuideScreen(),
        '/tools/primary_care_for_psychiatrists': (cntx) => PrimaryCareForPsychiatristsScreen(),
      },
    );
  }
}
