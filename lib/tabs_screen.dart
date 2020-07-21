import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Patients/PatientsHomeScreen.dart';
import 'package:flutter_complete_guide/Tools/Tools_screen.dart';
import './Patients/PatientsHomeScreen.dart';
import './Account/AccountScreen.dart';
import './Patients/auth_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './MainDrawer.dart';

class TabBarScreen extends StatefulWidget {
  @override
  _TabBarScreenState createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
      print(_selectedPageIndex);
    });
  }

  int _selectedPageIndex = 0;

  final List<Map<String, Object>> _pages = [
    {"page": ToolsScreen(), "title": "Tools"},
    {
      "page": StreamBuilder(
          stream: FirebaseAuth.instance.onAuthStateChanged,
          builder: (context, userSnapshot) {
            if (userSnapshot.hasData) {
              return PatientsHomeScreen();
            }
            ;
            return AuthScreen();
          }),
      "title": ""
    },
    {"page": AccountScreen(), "title": "My Account"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (_selectedPageIndex == 0 || _selectedPageIndex == 2)
          ? (AppBar(
              title: Text(
                  // _pages[_selectedPageIndex]['title'])
                  "Psych Station"),
            ))
          : null,
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), title: Text("Tools")),
          BottomNavigationBarItem(
              icon: Icon(Icons.group), title: Text("Patients")),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), title: Text("Account")),
        ],
      ),
    );
  }
}
