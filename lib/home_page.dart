import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:just_weather/functions%20&%20widgets/objects.dart';
import 'functions & widgets/widgets.dart';

class HomePage extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    final List<Day> week = ModalRoute.of(context)!.settings.arguments as List<Day>;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('JustWeather'),
      ),
      body: Center(
        child:ListView(
          children: <Widget>[
            Column(
              children: [
                WeatherCodeIcon(
                  code: week[0].dailyWeatherCode
                )
              ]
            )
          ],
        ),
      ),
    );
  }
}