import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  Widget buildListTitle(String attribute, String data) {
    return ListTile(
        leading: Text(attribute),
        title: Text(
          data,
          style: TextStyle(
              fontFamily: 'Raleway-Bold',
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        onTap: () {},); }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
          body: Container(
          child: Column(
            children: <Widget>[
              buildListTitle("Name:", "Nathan Skoller"),
              buildListTitle("Email:", "nskoller@gmail.com"),
              buildListTitle("Password:", "*********"),
              buildListTitle("Specialty:", "IM-Psychiatry"),
              buildListTitle("Level of Training:", "Resident"),
              buildListTitle("Location of Practice:", "GA, USA"),
              ElevatedButton.icon(onPressed: () {}, icon: Icon(Icons.edit), label: Text("Edit"))
            ],
          ),
        ),
      );
    }
  }
