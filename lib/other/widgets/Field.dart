import 'package:flutter/material.dart';
import 'package:just_weather/other/widgets/LableText.dart';

class Field extends StatelessWidget{

  final String text;
  const Field({required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            LableText(
              text: text,
            ),
            const Icon(
              Icons.arrow_right
            )
          ]
        ),
        const Divider()
      ]
    );
  }
}