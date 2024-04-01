part of 'imports.dart';

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
                  format: 'gif',
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
                LableText(
                  text: 'The weather for today'
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16), 
                  child : Container(
                    width: 370,
                    height: 80,
                    decoration: boxDecorationAsset(),
                    child: DayWeatherListView(
                      day: week.first
                    )
                  ),
                ),
                MoreInfoWigit(
                  week: week,
                  hour: hour,
                ),
                LableText(
                  text: 'Weather for the week'
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child : Container(
                    width: 370,
                    height: 90,
                    decoration: boxDecorationAsset(),
                    child: WeekWeatherListView(
                      week: week
                    )
                  ),
                ),
                FieldsWidget()
              ]
            )
          ],
        ),
      ),
    );
  }
}