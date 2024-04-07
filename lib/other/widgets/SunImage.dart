import 'package:flutter/material.dart';

extension RangeNum on num {
  bool isBetween(num a, num b) {
    return !((a > this && b > this) || (a < this &&  b < this));
  }
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
  
  Map<String,double> positionSwitch(sunset, sunrise){
    double oneDivision = (hourRounding(sunset) - hourRounding(sunrise)) / 5;
    double hour = DateTime.now().hour.toDouble();
    List<Map<String,double>> allPositions = [
      {'top': 110,'left': 67 },
      {'top': 70,'left': 95 },
      {'top': 47,'left': 160 },
      {'top': 70,'left': 223 },
      {'top': 110,'left': 250}
    ];
    for (int i = 4 ; i < 8 ; i++){
      if(i == 4){
        if(hour.isBetween(oneDivision, oneDivision*4)){
          return allPositions[i - 4];
        }
      }else{
        if(hour.isBetween(oneDivision*i-1, oneDivision*i)){
          return allPositions[i - 4];
        }
      }
    }
    return allPositions[4];
  }

  @override
  Widget build(BuildContext context) {
    Map<String,double> position = positionSwitch(sunset, sunrise);
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