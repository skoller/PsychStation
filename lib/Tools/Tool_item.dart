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
      case 'DSM Guide':
        {
          navPush('/tools/DSM_guide', (_) {});
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
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline1,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Colors.blueGrey,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
