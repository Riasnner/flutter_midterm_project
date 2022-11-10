import 'package:flutter/material.dart';
import 'package:flutter_midterm_project/screens/Settings.dart';
import 'package:flutter_midterm_project/widget/EmailTextField.dart';

class Dashboard extends StatefulWidget {
  static String routeName = "/dashboard";

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as EmailTextField;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Settings.routeName);
            },
            child: const Padding(padding: EdgeInsets.only(right: 15.0),
              child: Icon(Icons.settings, size: 30,),
            ),
          )
        ],
      ),
      body: Container(
        child: Center(
          child: Text(
            "Welcome ${arg.controller.text}!", 
            style: const TextStyle(
              fontSize: 25, 
              fontWeight: FontWeight.bold,
              color: Colors.blue
            )
          ),
        ),
      ),
    );
  }
}