import 'package:flutter/material.dart';

class LandmarkStudiesScreen extends StatelessWidget {

final studies = [ StudyInfographic("0", "Star*D Summary", "1.0", "6/21/2020") ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Landmark Studies"),
      ),
      body: 
      // ListView(
      //   padding: const EdgeInsets.all(25),
      //   children:
      //   (tools as List<Map<String, String>>).map( (tool) {
      //     return ToolItem(tool['id'], tool['title']);
      //   }).toList(),
        RaisedButton(child: Text("Study1"), onPressed: () {
          Navigator.pushNamed(context, StudyInfographicPage.routeName, arguments: studies[0]);
        },),
      );
  }
}



class StudyInfographic {
  final String id;
  final String title;
  final String version;
  final String lastUpdateDate;
  // final Image image;

  StudyInfographic(this.id, this.title, this.version, this.lastUpdateDate);
}





class StudyInfographicPage extends StatelessWidget {
 
    static const routeName = '/Study1';

  @override
  Widget build(BuildContext context) {
  final StudyInfographic studyArgs = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(title: Text(studyArgs.title),
      ),
      body: Center(child: 
              Text(studyArgs.id),
      ),
    );
  }
}

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