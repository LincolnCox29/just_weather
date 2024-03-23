import 'package:flutter/material.dart';

class WeatherCodeIcon extends StatelessWidget {

  WeatherCodeIcon({required this.code, required this.size});
  final int code;
  final double size;

  searchIcon(){
    if (code == 0){
      return 'clear sky.gif';
    }
    if ([1,2,3].contains(code)){
      return 'clouds.gif';
    }
    if ([45,48].contains(code)){
      return 'foggy.gif';
    }
    if ([51,53,55,56,57].contains(code)){
      return 'drizzle.gif';
    }
    if ([61,63,65,66,67].contains(code)){
      return 'rain.gif';
    }
    if ([71,73,75,77].contains(code)){
      return 'snow.gif';
    }
    if ([80,81,82,85,86,95,96,99].contains(code)){
      return 'storm.gif';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/gif/${searchIcon()}',
      width: size,
      height: size,
    );
  }
}

class RowWithIcon extends StatelessWidget {

  final String imageLink;
  final String text;
  
  RowWithIcon({required this.imageLink, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 2, bottom: 2),
      child:  Row(
        children: [
          Image.asset(
            imageLink,
            width: 30,
            height: 30,
          ),
          Text(
            text
          )
        ],
      )
    );
  }
}