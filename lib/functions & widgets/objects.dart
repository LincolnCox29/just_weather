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
  Day(
    this.date,
    this.temperatures,
    this.weatherCodes,
    this.windSpeed,
    this.cloudCover,
    this.dailyWeatherCode,
    this.location
  );
}