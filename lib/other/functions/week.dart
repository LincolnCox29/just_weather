import 'package:just_weather/other/objects/Day.dart';

List<Day> week(Map<dynamic,dynamic> weatherData){ //168
  List<Day> result = [];
  int counter = 0;
  int dayCounter = 0;
  List<double> temperatures = [];
  List<int> weatherCodes = [];
  List<double> windSpeed = [];
  List<int> cloudCover = [];
  for(int hour = 0; hour < 336; hour+= 24){
    if (counter < 24){
      var halfHour = 0;
      if (hour != 0){
        halfHour = (hour/2).round();
      }
      for(var i = halfHour; i < 24 + halfHour; i++){
        temperatures.add(weatherData["hourly"]["temperature_2m"][i]);
        weatherCodes.add(weatherData["hourly"]["weather_code"][i]);
        windSpeed.add(weatherData["hourly"]["wind_speed_10m"][i]);
        cloudCover.add(weatherData["hourly"]["cloud_cover"][i]);
        counter++;
      }
    }else{
      result.add(
        Day(
          weatherData["daily"]["time"][dayCounter],
          temperatures,
          weatherCodes, 
          windSpeed, 
          cloudCover, 
          weatherData["daily"]['weather_code'][dayCounter],
    	    weatherData["timezone"],
          weatherData["current"]["surface_pressure"],
          weatherData["current"]["wind_direction_10m"],
          weatherData["current"]["relative_humidity_2m"]
        )
      );
      counter = 0;
      temperatures = <double>[];
      weatherCodes = <int>[];
      windSpeed = <double>[];
      cloudCover = <int>[];
      dayCounter++;
    }
  }
  return result;
}