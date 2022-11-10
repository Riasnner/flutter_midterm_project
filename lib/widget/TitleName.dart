import 'package:flutter/material.dart';

class TitleName extends StatelessWidget {
  final String text;

  TitleName({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.blue
          )
        ),
      ),
    );
  }
}