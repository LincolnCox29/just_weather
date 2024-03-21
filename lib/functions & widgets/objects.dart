class Day{

  int avgTemperature(){
    return temperatures
      .reduce((value, element) => value + element)
      .round();
  }
  String date;
  List<double> temperatures;
  List<int> weatherCodes;
  List<double> windSpeed;
  List<int> cloudCover;
  int dailyWeatherCode;
  Day(
    this.date,
    this.temperatures,
    this.weatherCodes,
    this.windSpeed,
    this.cloudCover,
    this.dailyWeatherCode
  );
}