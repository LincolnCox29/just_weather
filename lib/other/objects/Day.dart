class Day{
  int avgTemperature(){
    return (temperatures
      .reduce((value, element) => value + element)/temperatures.length)
      .round();
  }
  String avgWindSpeed(){
    return (windSpeed
      .reduce((value, element) => value + element)/windSpeed.length)
      .toStringAsFixed(2);
  }
  int avgCloudCover(){
    return (cloudCover
      .reduce((value, element) => value + element)/cloudCover.length)
      .round();
  }
  String date;
  List<double> temperatures;
  List<int> weatherCodes;
  List<double> windSpeed;
  List<int> cloudCover;
  int dailyWeatherCode;
  String location;
  double surfacePressure;
  int windDirection;
  int relativeHumidity;
  String sunrise;
  String sunset;
  Day(
    this.date,
    this.temperatures,
    this.weatherCodes,
    this.windSpeed,
    this.cloudCover,
    this.dailyWeatherCode,
    this.location,
    this.surfacePressure,
    this.windDirection,
    this.relativeHumidity,
    this.sunrise,
    this.sunset
  );
}