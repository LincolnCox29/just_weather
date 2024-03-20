import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'functions & widgets/widgets.dart';

class HomePage extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    final weatherData = ModalRoute.of(context)!.settings.arguments as Map<dynamic,dynamic>;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('JustWeather'),
      ),
      body: Center(
        child:ListView(
          children: <Widget>[
            WeatherCodeIcon(
              code: weatherData["daily"]['weather_code'][0]
            ),
            Text('')
          ],
        ),
      ),
    );
  }
}