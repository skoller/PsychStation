import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTitle(String title, IconData icon) {
    return ListTile(
        leading: Icon(icon, size: 26),
        title: Text(
          title,
          style: TextStyle(
              fontFamily: 'Raleway-Bold',
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        onTap: () {});
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            child: Text("PsychStation",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Theme.of(context).primaryColor)),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTitle("About", Icons.question_answer),
          buildListTitle("Authors", Icons.person_outline),
          buildListTitle("Contact", Icons.contact_mail),
        ],
      ),
    );
  }
}
