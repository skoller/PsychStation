import 'package:flutter_complete_guide/LocalData/PsLocalDatabase.dart';
import 'package:flutter_complete_guide/models/PatientModel.dart';

import './Tools/Tools_screen.dart';
import './Tools/Calculators/Calculators_list_screen.dart';
import './Tools/Calculators/Lithium_calc/Li_calc_screen.dart';
import './Tools/Calculators/Benzo_calc/Benzo_calc_screen.dart';
import './Tools/Scales/Scales_list_screen.dart';
import './Tools/Scales/Phq9/Phq9_screen.dart';
import './Tools/Scales/Gad7/Gad7_screen.dart';
import './Tools/Landmark_Studies/Landmark_studies_screen.dart';
import './Tools/Clinical_Guides/Clinical_guides_screen.dart';
import './Tools/Local_Resources/Local_resources_screen.dart';
import './Tools/Medications/Medications_screen.dart';
import './Tools/DSM_Guide/DSM_guide_screen.dart';
import './Tools/Primary_Care_For_Psychiatrists/Primary_care_for_psychiatrists_screen.dart';
import './tabs_screen.dart';

import 'package:flutter_complete_guide/models/Gad7_model.dart';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;


void main() async {

  // await Hive.initFlutter();
 
  runApp(MyApp());
  final appDocumentDirectory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(PatientModelAdapter());
  await Hive.openBox<PatientModel>('patients');
  }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Gad7model(),
        ),
        // Provider.value(
        //   value: PsLocalDb(),
        // )
      ],
      child: MaterialApp(
        title: 'Psych Station',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          accentColor: Colors.lightGreen,
          buttonTheme: ButtonTheme.of(context).copyWith(
            buttonColor: Colors.lightGreen,
            textTheme: ButtonTextTheme.primary,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          canvasColor: Colors.grey[100],
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: TextStyle(
                  fontSize: 20,
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                bodyText2: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                headline1: TextStyle(
                  fontSize: 25,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
        home: TabBarScreen(),
        routes: {
          '/tools': (cntx) => ToolsScreen(),
          '/tools/calculators': (cntx) => CalculatorsListScreen(),
          '/tools/scales': (cntx) => ScalesListScreen(),
          '/tools/landmark_studies': (cntx) => LandmarkStudiesScreen(),
          '/tools/clinical_guides': (cntx) => ClinicalGuidesScreen(),
          '/tools/local_resources': (cntx) => LocalResourcesScreen(),
          '/tools/medications': (cntx) => MedicationsScreen(),
          '/tools/DSM_guide': (cntx) => DSMGuideScreen(),
          '/tools/primary_care_for_psychiatrists': (cntx) =>
              PrimaryCareForPsychiatristsScreen(),
          '/tools/calculators/Li': (cntx) => LiCalcScreen(),
          '/tools/calculators/Benzo': (cntx) => BenzoCalcScreen(),
          '/tools/scales/phq9': (cntx) => Phq9Screen(),
          '/tools/scales/gad7': (cntx) => Gad7Screen(),
          StudyInfographicPage.routeName: (cntx) => StudyInfographicPage()
        },
      ),
    );
  }
}
