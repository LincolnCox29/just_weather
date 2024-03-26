import 'dart:async';
import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'objects.dart';

Future<Position> determinePosition() async {
  LocationPermission permission;

  permission = await Geolocator.checkPermission();

  if(permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if(permission == LocationPermission.denied) {
      return Future.error('Location Permissions are denied');
    }
  }
  return await Geolocator.getCurrentPosition();
}

Future<Map<dynamic,dynamic>> httpRequest(link) async {
  final uri = Uri.parse(link);
  final response = await http.get(uri);

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load');
  }
}

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
    	    weatherData["timezone"]
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