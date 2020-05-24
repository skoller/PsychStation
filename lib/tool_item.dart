import 'package:flutter/material.dart';

class ToolItem extends StatelessWidget {
  final String id;
  final String title;

  ToolItem(this. id, this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
