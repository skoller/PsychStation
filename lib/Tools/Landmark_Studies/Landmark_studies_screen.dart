import 'package:flutter/material.dart';

class LandmarkStudiesScreen extends StatefulWidget {
  @override
  _LandmarkStudiesScreenState createState() => _LandmarkStudiesScreenState();
}

class _LandmarkStudiesScreenState extends State<LandmarkStudiesScreen> {
  static List<StudyInfographic> studies = [
    StudyInfographic("0", "STEP-BD", "1.0", "6/21/2020",
        AssetImage('lib/assets/images/StudyImage_StepBD.png')),
    StudyInfographic("1", "STAR*D", "1.0", "6/21/2020",
        AssetImage('lib/assets/images/StudyImage_StepBD.png')),
    StudyInfographic("2", "CATIE", "1.0", "6/21/2020",
        AssetImage('lib/assets/images/StudyImage_StepBD.png'))
  ];

  List<StudyInfographic> newStudiesList = List.from(studies);

  onItemChanged(String value) {
    setState(() {
      newStudiesList = studies
          .where((e) => e.title.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Landmark Studies"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Search Title...',
              ),
              onChanged: onItemChanged,
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(12.0),
              children: newStudiesList.map((data) {
                return ListTile(
                    title: Text(data.title),
                    onTap: () => Navigator.pushNamed(
                        context, StudyInfographicPage.routeName,
                        arguments: studies[int.parse(data.id)]));
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class StudyInfographic {
  final String id;
  final String title;
  final String version;
  final String lastUpdateDate;
  final AssetImage image;

  StudyInfographic(
      this.id, this.title, this.version, this.lastUpdateDate, this.image);
}

class StudyInfographicPage extends StatelessWidget {
  static const routeName = '/StudyInfographicPage';

  @override
  Widget build(BuildContext context) {
    final StudyInfographic studyArgs =
        ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(studyArgs.title),
      ),
      body: GestureDetector(
        child: Container(
            width: double.infinity,
            child: SingleChildScrollView(child: Image(image: studyArgs.image))),
      ),
    );
  }
}

//         Container(
//           padding: EdgeInsets.all(5),
//           margin: EdgeInsets.all(5),
//           decoration: const BoxDecoration(border: Border(
//   top: BorderSide(width: 1.0, color: Color(0xFFFFDFDFDF)),
//   left: BorderSide(width: 1.0, color: Color(0xFFFFDFDFDF)),
//   right: BorderSide(width: 1.0, color: Color(0xFFFF7F7F7F)),
//   bottom: BorderSide(width: 1.0, color: Color(0xFFFF7F7F7F)),
// ),),
//           child: ListTile(
//             title: Text("STEP-BD"),
//             subtitle: Text("Effectiveness of Adjunctive Antidepressant Treatment for Bipolar Depression"),
//             onTap: () {
//             Navigator.pushNamed(context, StudyInfographicPage.routeName, arguments: studies[0]);
//           },),
//         ),

// void selectStudy(BuildContext context) {
//   void navPush(String route, Function args) {
//     Navigator.of(context).pushNamed(route, arguments: args);
//   }

//   switch (title) {
//     case 'Study_Star*D_Summary':
//       {
//         navPush('/tools/calculators', (_) {});
//       }
//       break;

//       break;
//     default:
//       {}
//   }
// }

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () => selectTool(context),
//       splashColor: Theme.of(context).primaryColor,
//       borderRadius: BorderRadius.circular(15),
//       child: Container(
//         width: double.infinity,
//         padding: EdgeInsets.all(5),
//         child: Card(
//           margin: EdgeInsets.all(2),
//           child: Container(
//             padding: EdgeInsets.only(top: 10, bottom: 10),
//             child: Text(
//               title,
//               style: Theme.of(context).textTheme.bodyText1,
//               textAlign: TextAlign.center,

//                // padding: const EdgeInsets.all(10),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
