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
    if(hour.isBetween(oneDivision, oneDivision*4)){
      return {
        'top': 110,
        'left': 67 
      };
    }else{
      if(hour.isBetween(oneDivision*4, oneDivision*5)){
        return {
          'top': 70,
          'left': 95 
        };
      }else{
        if(hour.isBetween(oneDivision*5, oneDivision*6)){
          return {
            'top': 47,
            'left': 160 
          };
        }else{
          if(hour.isBetween(oneDivision*6, oneDivision*7)){
            return {
              'top': 70,
              'left': 223 
            };
          }else{
            return {
              'top': 110,
              'left': 250                 
            };
          }
        }
      }
    }
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