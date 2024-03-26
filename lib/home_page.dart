import 'package:flutter/material.dart';
import 'package:just_weather/functions%20&%20widgets/objects.dart';
import 'functions & widgets/widgets.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key});

  
  @override
  Widget build(BuildContext context) {
    int hour = DateTime.now().hour.toInt();
    final List<Day> week = ModalRoute.of(context)!.settings.arguments as List<Day>;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Row(
          children: [
            const Expanded(
              child: Text('JustWeather')
            ),
            Text(
              week.first.location
            )
          ]
        ),
        elevation:10,
      ),
      body: Center(
        child:ListView(
          children: <Widget>[
            Column(
              children: [
                WeatherCodeIcon(
                  code: week.first.weatherCodes[hour],
                  size: 110,
                ),
                Text(
                  '${week
                    .first
                    .temperatures[hour]
                    .round()}°',
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 50
                  ),
                ),
                const Text(
                  'The weather for today',
                  style: TextStyle(
                    fontSize: 20
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16), 
                  child : Container(
                    width: 370,
                    height: 80,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black
                      )
                    ),
                    child: DayWeatherListView(day: week.first)
                  ),
                ),
                const Text(
                  'More information',
                  style: TextStyle(
                    fontSize: 20
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child : Container(
                    width: 370,
                    height: 210,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.black
                      )
                    ),
                    child: Column(
                      children: [
                        RowWithIcon(
                          imageLink: 'assets/gif/hot.gif', 
                          text: 'Average temperature: ${week.first.avgTemperature()}°'
                        ),
                        RowWithIcon(
                          imageLink: 'assets/gif/wind.gif',
                          text: 'Wind speed (now): ${week.first.windSpeed[hour]} m/s'
                        ),
                        RowWithIcon(
                          imageLink: 'assets/gif/wind avg.gif',
                          text: 'Average wind speed: ${week.first.avgWindSpeed()} m/s'
                        ),
                        RowWithIcon(
                          imageLink: 'assets/gif/cloudy.gif',
                          text: 'Cloud cover (now): ${week.first.cloudCover[hour]}%'
                        ),
                        RowWithIcon(
                          imageLink: 'assets/gif/cloudy avg.gif',
                          text: 'Average cloud cover: ${week.first.avgCloudCover()}%'
                        ),
                        RowWithIcon(
                          imageLink: 'assets/gif/date.gif',
                          text: 'Date: ${
                            DateTime.now().year.toString()}-${
                              DateTime.now().month.toString()}-${
                                DateTime.now().day.toString()}'
                        )
                      ],
                    )
                  ),
                ),
                const Text(
                  'Weather for the week',
                  style: TextStyle(
                    fontSize: 20
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16), 
                  child : Container(
                    width: 370,
                    height: 90,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black
                      )
                    ),
                    child: WeekWeatherListView(week: week)
                  ),
                ),
              ]
            )
          ],
        ),
      ),
    );
  }
}