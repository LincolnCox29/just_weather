import 'package:flutter/material.dart';

class LableText extends StatelessWidget{

  final String text;

  LableText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w200
      ),
    );
  }
}