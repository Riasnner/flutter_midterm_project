import 'package:flutter/material.dart';
import 'package:flutter_midterm_project/screens/loginPage.dart';
import 'package:flutter_midterm_project/services/AuthService.dart';

class Settings extends StatefulWidget {
  static String routeName = "/settings";

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  AuthService _authService = AuthService();
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
          title: const Text("Settings"),
          actions: [
            GestureDetector(
              onTap: () async{
                await _authService.logout();
                // ignore: use_build_context_synchronously
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
      ),
    );
  }
}