part of 'main.dart';

class load extends StatefulWidget {
  @override
  State<load> createState() => _loadState();
}

class _loadState extends State<load> {

  @override
  void initState
  (){
    super.initState();
    _getCurrentLocation();
    try{
      Timer(const Duration(seconds: 2), () {
        _getWeatherData();
      });
    }catch(e){
      Timer(const Duration(seconds: 5), () {
        _getWeatherData();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    loadBody(){
      Timer(Duration(seconds: 2), () {
        if(_weatherData == null){
          loadBody();
        }else{
          try{
            Map<dynamic,dynamic> arg = _weatherData as Map<dynamic,dynamic>;
            Navigator.pushReplacementNamed(context, '/home', arguments: arg);
          }catch(e){}
        }
      });
    }
    loadBody();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/gif/sun.gif',
              height: 100,
              width: 100,
            ),
            _position != null ? Text(_position.toString()) : const Text('')
          ],
        )
      ),
    );
  }

  Position? _position;
  Map<dynamic,dynamic>? _weatherData;

  void _getCurrentLocation() async {
    Position position = await determinePosition();
    setState(() {
      _position = position;
    });
  }

  void _getWeatherData() async {
    Map<dynamic,dynamic>? weatherData;
    if (_position != null){
      weatherData = await httpRequest(
        'https://api.open-meteo.com/v1/forecast?latitude=${_position!.latitude}&longitude=${_position!.longitude}&hourly=temperature_2m,rain,showers,snowfall,snow_depth,weather_code,cloud_cover,wind_speed_10m&daily=weather_code&wind_speed_unit=ms&timezone=auto&forecast_days=1'
      );
    }
    setState(() {
      _weatherData = weatherData;
    });
  }
}