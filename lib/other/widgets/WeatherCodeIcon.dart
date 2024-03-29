import 'package:flutter/material.dart';

class WeatherCodeIcon extends StatelessWidget {

  WeatherCodeIcon({required this.code, required this.size, required this.format});
  final int code;
  final double size;
  final String format;

  searchIcon(){
    if ([0,1].contains(code)){
      return 'clear sky.$format';
    }
    if ([2,3].contains(code)){
      return 'clouds.$format';
    }
    if ([45,48].contains(code)){
      return 'foggy.$format';
    }
    if ([51,53,55,56,57].contains(code)){
      return 'drizzle.$format';
    }
    if ([61,63,65,66,67].contains(code)){
      return 'rain.$format';
    }
    if ([71,73,75,77].contains(code)){
      return 'snow.$format';
    }
    if ([80,81,82,85,86,95,96,99].contains(code)){
      return 'storm.$format';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/$format/${searchIcon()}',
      width: size,
      height: size,
    );
  }
}