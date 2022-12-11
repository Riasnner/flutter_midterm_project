import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_midterm_project/screens/Dashboard.dart';
import 'package:flutter_midterm_project/screens/SignUpPage.dart';
import 'package:flutter_midterm_project/services/AuthService.dart';
import 'package:flutter_midterm_project/widget/EmailTextField.dart';
import 'package:flutter_midterm_project/widget/PasswordField.dart';
import 'package:flutter_midterm_project/widget/PrimaryButton.dart';
import 'package:flutter_midterm_project/widget/TitleName.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatefulWidget {
  static String routeName = "/login";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AuthService _authService = AuthService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscurePassword = true;
  bool isLoggedIn = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child: Center (
          child: ModalProgressHUD(
            inAsyncCall: isLoggedIn,
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
                           loginEmailPassword();
                        }),
                      const SizedBox(
                        height: 20.0,
                      ),
                      PrimaryButton(
                        text: "Sign In Using Google", 
                        iconData: Icons.login, 
                        onPress: () {
                           loginWithProvider();
                        }),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, SignUpPage.routeName);
                        },
                        child: const Text(
                          "Don't have an account? Sign up here",
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ),
                    ],
                  ),
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

  loginWithProvider() async{
    try{
      setState(() {
        isLoggedIn = true;
      });
      var user = await _authService.signInWithGoogle();
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, Dashboard.routeName);
    }catch(e){
      print(e.toString());
    }
    setState(() {
      isLoggedIn = false;
    });
  }

  loginEmailPassword() async{
    try {
      setState(() {
        isLoggedIn = true;
      });
      var user = await _authService.signInEmailPass(emailController.text, passwordController.text);
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, Dashboard.routeName);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    setState(() {
      isLoggedIn = false;
    });
  }
}