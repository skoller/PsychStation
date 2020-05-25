import 'package:flutter/material.dart';

class ScalesListItem extends StatelessWidget {
  final String id;
  final String title;

  ScalesListItem(this.id, this.title);

  void selectCalc(BuildContext context, String title) {
    void navPush(String route, Function args) {
      Navigator.of(context).pushNamed(route, arguments: args);
    }

    switch (title) {
      case 'PHQ9':
        {
          navPush('/tools/scales/phq9', (_) {});
        }
        break;
      case 'GAD7':
        {
          navPush('/tools/scales/gad7', (_) {});
        }
        break;
      default:
        {}
    }
  }

  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.only(left: 15, right: 15, top: 15),
        child: Card(
          child: InkWell(
            onTap: () => selectCalc(context, title),
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ));
  }
}
