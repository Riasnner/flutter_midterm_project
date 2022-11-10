import 'package:flutter/material.dart';

class ConfirmPasswordField extends StatelessWidget {
  final bool obscureTextF;
  final String labelText;
  final String hintText;
  final TextEditingController controller;

  ConfirmPasswordField({
    required this.obscureTextF,
    required this.labelText,
    required this.hintText,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureTextF,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12.0)
          ))
      ),
      controller: controller,
    );
  }
}