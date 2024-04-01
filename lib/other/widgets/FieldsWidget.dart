import 'package:flutter/material.dart';
import 'package:just_weather/other/widgets/Field.dart';

class FieldsWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 370,
      child: Column(
        children: [
          Field(
            text: 'Sources'
          ),
        ],
      )
    );
  }
}