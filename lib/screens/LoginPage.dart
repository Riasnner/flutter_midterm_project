import 'package:flutter/material.dart';
import 'package:flutter_midterm_project/screens/Dashboard.dart';
import 'package:flutter_midterm_project/screens/SignUpPage.dart';
import 'package:flutter_midterm_project/widget/EmailTextField.dart';
import 'package:flutter_midterm_project/widget/PasswordField.dart';
import 'package:flutter_midterm_project/widget/PrimaryButton.dart';
import 'package:flutter_midterm_project/widget/TitleName.dart';

class LoginPage extends StatefulWidget {
  static String routeName = "/login";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child: Center (
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                width: width * .9,
                child: Column(
                  children: [
                    TitleName(text: "LOGIN"),
                    EmailTextField(
                      labelText: "Email Address", 
                      hintText: "Enter your Email Address", 
                      controller: emailController, 
                      textInputType: TextInputType.emailAddress),
                    const SizedBox(
                      height: 20.0,
                    ),
                    PasswordField(
                      obscureText: obscurePassword, 
                      onTap: handleObscurePassword, 
                      labelText: "Password", 
                      hintText: "Enter your Password", 
                      controller: passwordController
                      ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    PrimaryButton(
                      text: "Login", 
                      iconData: Icons.login, 
                      onPress: () {
                        Navigator.pushReplacementNamed(
                          context, 
                          Dashboard.routeName,
                          arguments: EmailTextField(
                      labelText: "Email Address", 
                      hintText: "Enter your Email Address", 
                      controller: emailController, 
                      textInputType: TextInputType.emailAddress),
                          );
                      }),
                    const SizedBox(
                      height: 20.0,
                    ),
                    PrimaryButton(
                      text: "Don't have an account? Sign up here", 
                      iconData: Icons.app_registration, 
                      onPress: () {
                        Navigator.pushReplacementNamed(context, SignUpPage.routeName);
                    }),
                  ],
                ),
              ),
            ),
          ),
        ),
      )
    );
  }
  handleObscurePassword(){
    setState(() {
      obscurePassword = !obscurePassword;
    });
  }
}