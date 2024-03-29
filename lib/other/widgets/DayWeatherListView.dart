import 'package:flutter/material.dart';
import 'package:just_weather/other/objects/Day.dart';
import 'package:just_weather/other/widgets/WeatherCodeIcon.dart';

class DayWeatherListView extends StatelessWidget {

  final Day day;

  DayWeatherListView({required this.day});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 24,
      itemBuilder:(context, index) {
        return Container(
          width: 50,
          height: 80,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black
            )
          ),
          child: Column(
            children: [
              Text(
                '$index:00',
                style: const TextStyle(
                  fontSize: 10
                ),
              ),
              WeatherCodeIcon(
                format: 'png',
                code: day.weatherCodes[index],
                size: 40,
              ),
              Text(
                '${day
                  .temperatures[index]
                  .round()}°'
              )
            ]
          ),
        );
      },
    );
  }
}