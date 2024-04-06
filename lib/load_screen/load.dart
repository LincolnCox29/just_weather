part of 'imports.dart';

class Load extends StatefulWidget {
  @override
  State<Load> createState() => _LoadState();
}

class _LoadState extends State<Load> {

  bool dataReceived = false;

  @override
  void initState
  (){
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    loadBody(){
      Timer(Duration(seconds: 2), () {
        if(_weatherData == null){
          loadBody();
        }else if(_weatherData != null){
          try{
            List<Day>? arg = week(_weatherData!);
            Navigator.pushReplacementNamed(context, '/home', arguments: arg);
          }catch(e){}
        }
      });
    }
    void _waitCurrentLocation() {
      if(_position != null && dataReceived == false){
        _getWeatherData();
      }
    }
    loadBody();
    _waitCurrentLocation();
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
            Column(
              children: [
                _position != null ? Text(_position!.latitude.toString()) : const Text(''),
                _position != null ? Text(_position!.longitude.toString()) : const Text('')
              ]
            )
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
        'https://api.open-meteo.com/v1/forecast?latitude=${
          _position!.latitude
        }&longitude=${
          _position!.longitude
        }&current=relative_humidity_2m,surface_pressure,wind_direction_10m&hourly=temperature_2m,weather_code,cloud_cover,wind_speed_10m&daily=weather_code,sunrise,sunset&wind_speed_unit=ms&timezone=auto'
      );
    }
    _weatherData = weatherData;
  }
}