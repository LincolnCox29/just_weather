import 'package:flutter/material.dart';

bool isBetween(double value, double start, double end) {
  return value >= start && value < end;
}

// ignore: must_be_immutable
class SunImage extends StatelessWidget {
  
  String sunrise;
  String sunset;
  
  SunImage({super.key, required this.sunrise, required this.sunset});

  int hourRounding(String time){
    if(int.parse(time.substring(3)) >= 30){
      return int.parse(time.substring(0,2)) + 1;
    }else{
      return int.parse(time.substring(0,2));
    }
  }
  
  Map<String,double> positionSwitch(String sunset, String sunrise, BuildContext context){
    double oneDivision = (hourRounding(sunset) - hourRounding(sunrise)) / 5;
    double hour = DateTime.now().hour.toDouble();

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    List<Map<String,double>> allPositions = [
      {'top': screenHeight / 8,'left': screenWidth / 6.8},
      {'top': screenHeight / 13,'left': screenWidth / 4.1},
      {'top': screenHeight / 18,'left': screenWidth / 2.6},
      {'top': screenHeight / 13,'left': screenWidth / 1.9},
      {'top': screenHeight / 8,'left': screenWidth / 1.62}
    ];
    for (int i = 0 ; i < 5 ; i++){
      if (i == 0) {
        if (isBetween(hour, oneDivision * i, oneDivision * (i + 1))) {
          return allPositions[i];
        }
      } else {
        if (isBetween(hour, oneDivision * (i - 1), oneDivision * i)) {
          return allPositions[i];
        }
      }
    }
    return allPositions[4];
  }

  @override
  Widget build(BuildContext context) {
    Map<String,double> position = positionSwitch(sunset, sunrise, context);
    return Padding(
      padding: EdgeInsets.only(
        top: position['top']!,
        bottom: 0,
        right: 0,
        left: position['left']!
      ),
      child: Image.asset(
        'assets/png/sun.png',
        width: 40,
        height: 40
      ),
    );
  }
}