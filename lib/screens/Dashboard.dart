import 'package:flutter/material.dart';
import 'package:flutter_midterm_project/screens/Settings.dart';

class Dashboard extends StatefulWidget {
  static String routeName = "/dashboard";

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/background.jpg'
              ),
              fit: BoxFit.cover,
            ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
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
          body: const Center(
            child: Text(
              "Welcome!",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.lightBlueAccent,
              ),
            ),
          ),
      ),
    );
  }
}