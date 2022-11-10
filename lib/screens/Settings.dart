import 'package:flutter/material.dart';
import 'package:flutter_midterm_project/screens/loginPage.dart';

class Settings extends StatefulWidget {
  static String routeName = "/settings";

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        actions: [
          GestureDetector(
            onTap: () {
              // Navigator.popAndPushNamed(context, LoginPage.routeName);
              Navigator.of(context).pushNamedAndRemoveUntil(
                LoginPage.routeName, (Route<dynamic> route) => false);
            },
            child: const Padding(padding: EdgeInsets.only(right: 15.0),
              child: Icon(
                Icons.logout, 
                size: 30
              ),
            ),
          )
        ],
      ),
    );
  }
}