import 'package:flutter/material.dart';
import 'package:just_weather/other/objects/Day.dart';

class SunPosition extends StatelessWidget {

  final List<Day> week;
  final bool isRight;

  const SunPosition({
    super.key,
    required this.week,
    required this.isRight,
  });

  @override
  Widget build(BuildContext context) {
    late final double position;
    late final String time;
    late final String text;
    if(isRight){
      position = 145;
      time = week.first.sunset;
      text = 'Sunset';
    }else{
      position = 60;
      time = week.first.sunrise;
      text = 'Sunrise';
    }
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 110,
            left: position
          ),
          child: Column(
            children: [
              Text(
                time.substring(
                  time.length - 5
                )
              ),
              Text(text)
            ]
          )
        )
      ]
    );
  }
}