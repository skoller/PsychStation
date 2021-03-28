import 'package:flutter/material.dart';

class DSM_section extends StatelessWidget {
  final String id;
  final String title;

  DSM_section(this.id, this.title);

  void selectTool(BuildContext context) {
    void navPush(String route, Function args) {
      Navigator.of(context).pushNamed(route, arguments: args);
    }

    switch (id) {
      case 'd1':
        {
          navPush('/dsm/neurodev', (_) {});
        }
        break;
      case 'd2':
        {
          navPush('/tools/scales', (_) {});
        }
        break;
      case 'd3':
        {
          navPush('/tools/landmark_studies', (_) {});
        }
        break;
      case 'd4':
        {
          navPush('/tools/clinical_guides', (_) {});
        }
        break;
      case 'd5':
        {
          navPush('/tools/local_resources', (_) {});
        }
        break;
      case 'd6':
        {
          navPush('/tools/medications', (_) {});
        }
        break;
      case 'd7':
        {
          navPush('/tools/DSM_guide', (_) {});
        }
        break;
      case 'd8':
        {
          navPush('/tools/primary_care_for_psychiatrists', (_) {});
        }
        break;
        case 'd9':
        {
          navPush('/tools/calculators', (_) {});
        }
        break;
      case 'd10':
        {
          navPush('/tools/scales', (_) {});
        }
        break;
      case 'd11':
        {
          navPush('/tools/landmark_studies', (_) {});
        }
        break;
      case 'd12':
        {
          navPush('/tools/clinical_guides', (_) {});
        }
        break;
      case 'd13':
        {
          navPush('/tools/local_resources', (_) {});
        }
        break;
      case 'd14':
        {
          navPush('/tools/medications', (_) {});
        }
        break;
      case 'd15':
        {
          navPush('/tools/DSM_guide', (_) {});
        }
        break;
      case 'd16':
        {
          navPush('/tools/primary_care_for_psychiatrists', (_) {});
        }
        break;
         case 'd17':
        {
          navPush('/tools/landmark_studies', (_) {});
        }
        break;
      case 'd18':
        {
          navPush('/tools/clinical_guides', (_) {});
        }
        break;
      case 'd19':
        {
          navPush('/tools/local_resources', (_) {});
        }
        break;
      case 'd20':
        {
          navPush('/tools/medications', (_) {});
        }
        break;
      case 'd21':
        {
          navPush('/tools/DSM_guide', (_) {});
        }
        break;
      case 'd22':
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
              textAlign: TextAlign.left,

               // padding: const EdgeInsets.all(10),
            ),
          ),
        ),
      ),
    );
  }
}