part of 'imports.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    int hour = DateTime.now().hour.toInt();
    final List<Day> week = ModalRoute.of(context)!.settings.arguments as List<Day>;
    const String degree = '℃';
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Row(
          children: [
            Expanded(
              child: LableText(
                text: 'JustWeather'
              )
            ),
            LableText(
              text: week.first.location
            )
          ]
        ),
        elevation:10,
      ),
      body: Center(
        child:ListView(
          children: <Widget>[
            Row(
              children: [
                Column(
                  children: [
                    SmallContainer(
                      child: Text(
                        '${week
                          .first
                          .temperatures[hour]
                          .round()}$degree',
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 50
                        ),
                      ),
                    ),
                    SmallContainer(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${week.first.relativeHumidity}%',
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 25
                            ),
                          ),
                          const Text(
                            'Humidity'
                          )
                        ]
                      )
                    ),
                  ],
                ),
                BigContainer(
                  child: WeatherCodeIcon(
                    format: 'gif',
                    code: week.first.weatherCodes[hour],
                    size: 110,
                  )
                )
              ]
            ),
            Row(
              children: [
                SmallContainer(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${week.first.windSpeed[hour]}m/s',
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 25
                        ),
                      ),
                      const Text(
                        'Wind Speed'
                      )
                    ],
                  )
                ),
                SmallContainer(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Transform.rotate(
                        angle: week.first.windDirection * pi / 180,
                        child: const Icon(
                          Icons.arrow_downward
                        )
                      ),
                      const Text(
                        'Wind Direction'
                      )
                    ]
                  )
                )
              ],
            ),
            Column(
              children: [
                MoreInfoWigit(
                  week: week,
                  hour: hour,
                ),
                LongContainer(
                  child:Column(
                    children: [
                      LableText(
                        text: 'The weather for today'
                      ),
                      SizedBox(
                        width: 370,
                        height: 75,
                        child:  DayWeatherListView(
                          day: week.first
                        ),
                      )
                    ]
                  )
                ),
                BigLongContainer(
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          LableText(
                            text: 'Sun path diagram'
                          ),
                          CustomPaint(
                            painter: DrawArc(),
                          ),
                          Row(
                            children: [
                              SunPosition(
                                week: week, 
                                isRight: false
                              ),
                              SunPosition(
                                week: week, 
                                isRight: true
                              )
                            ]
                          )
                        ]
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          top: 110,
                          bottom: 0,
                          right: 0,
                          left: 67
                        ),
                        child: Image.asset(
                          'assets/png/sun.png',
                          width: 40,
                          height: 40
                        ),
                      )
                    ]
                  )
                ),
                LongContainer(
                  child: Column(
                    children: [
                      LableText(
                        text: 'Weather for the week'
                      ),
                      SizedBox(
                        width: 370,
                        height: 75,
                        child:  WeekWeatherListView(
                          week: week
                        )
                      )
                    ]
                  )
                )
              ]
            )
          ],
        ),
      ),
    );
  }
}