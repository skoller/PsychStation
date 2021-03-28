import 'package:flutter/material.dart';

class ToolItem extends StatelessWidget {
  final String id;
  final String title;

  ToolItem(this.id, this.title);

  void selectTool(BuildContext context) {
    void navPush(String route, Function args) {
      Navigator.of(context).pushNamed(route, arguments: args);
    }

    switch (title) {
      case 'Calculators':
        {
          navPush('/tools/calculators', (_) {});
        }
        break;
      case 'Scales':
        {
          navPush('/tools/scales', (_) {});
        }
        break;
      case 'Landmark Studies':
        {
          navPush('/tools/landmark_studies', (_) {});
        }
        break;
      case 'Clinical Guides':
        {
          navPush('/tools/clinical_guides', (_) {});
        }
        break;
      case 'Local Resources':
        {
          navPush('/tools/local_resources', (_) {});
        }
        break;
      case 'Medications':
        {
          navPush('/tools/medications', (_) {});
        }
        break;
      case 'DSM':
        {
          navPush('/tools/DSM', (_) {});
        }
        break;
      case 'Primary Care for Psychiatrists':
        {
          navPush('/tools/primary_care_for_psychiatrists', (_) {});
        }
        break;
      default:
        {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectTool(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(5),
        // child: Text(
        //   title, style: Theme.of(context).textTheme.bodyText1,
        //   textAlign: TextAlign.center,
        // )
        child: Card(
          margin: EdgeInsets.all(2),
          child: Container(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyText1,
              textAlign: TextAlign.center,

               // padding: const EdgeInsets.all(10),
            ),
          ),
        ),
      ),
    );
  }
}

// Container(
//   padding: const EdgeInsets.all(15),
//   child: Text(
//     title,
//     style: Theme.of(context).textTheme.headline1,
//   ),
//   decoration: BoxDecoration(
//     boxShadow: [
//       BoxShadow(
//         color: Theme.of(context).primaryColor,
//         blurRadius: 1.0, // soften the shadow
//         spreadRadius: 1.0, //extend the shadow
//         // offset: Offset(
//         //   15.0, // Move to right 10  horizontally
//         //   15.0, // Move to bottom 10 Vertically
//         // ),
//       ),
//     ],
//      borderRadius: BorderRadius.circular(15),
//   ),
// ),
