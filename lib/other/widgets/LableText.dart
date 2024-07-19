import 'package:flutter/material.dart';

class LableText extends StatelessWidget{

  final String text;

  LableText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: MediaQuery.of(context).size.width * 0.05,
        fontWeight: FontWeight.w200
      ),
    );
  }
}