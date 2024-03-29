import 'package:flutter/material.dart';
import 'package:just_weather/other/objects/Day.dart';
import 'package:just_weather/other/widgets/WeatherCodeIcon.dart';

class WeekWeatherListView extends StatelessWidget {

  final List<Day> week;

  WeekWeatherListView({required this.week});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 7,
      itemBuilder:(context, index) {
        return Container(
          width: 90,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black
            )
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child : Text(
                  week[index].date,
                  style: const TextStyle(
                    fontSize: 10
                  ),
                )
              ),
              WeatherCodeIcon(
                format: 'png',
                code: week[index].dailyWeatherCode,
                size: 40,
              ),
            ]
          ),
        );
      },
    );
  }
}