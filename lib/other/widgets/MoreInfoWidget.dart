import 'dart:math' show pi;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:just_weather/other/functions/BoxDecorationAsset.dart';
import 'package:just_weather/other/objects/Day.dart';
import 'package:just_weather/other/widgets/LableText.dart';
import 'package:just_weather/other/widgets/RowWithIcon.dart';

class MoreInfoWigit extends StatefulWidget {

  late final List<Day> week;
  late final int hour;
  
  MoreInfoWigit({required this.week, required this.hour});
  
  @override
  State<MoreInfoWigit> createState() => MoreInfoState();
}

class MoreInfoState extends State<MoreInfoWigit> {
  late final List<Day> _week;
  late final int _hour;
  late Widget contant;
  late double angle;
  bool isActive = false;

  @override
  void initState(){
    super.initState();
    setState(() {
      _week = widget.week;
      _hour = widget.hour;
      angle = 0 * pi / 180;
      contant = Container();
    });
  }

  @override
  Widget build(Object context) {
    return GestureDetector(
      onTap: (){
        isActive = !isActive;
        setState(() {
          if(isActive){
            angle = 90 * pi / 180;
            contant = Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child : Container(
                width: 370,
                height: 175,
                decoration: boxDecorationAsset(),
                child: Column(
                  children: [
                    RowWithIcon(
                      imageLink: 'assets/gif/hot.gif', 
                      text: 'Average temperature: ${_week.first.avgTemperature()}°'
                    ),
                    RowWithIcon(
                      imageLink: 'assets/gif/wind avg.gif',
                      text: 'Average wind speed: ${_week.first.avgWindSpeed()} m/s'
                    ),
                    RowWithIcon(
                      imageLink: 'assets/gif/cloudy.gif',
                      text: 'Cloud cover (now): ${_week.first.cloudCover[_hour]}%'
                    ),
                    RowWithIcon(
                      imageLink: 'assets/gif/cloudy avg.gif',
                      text: 'Average cloud cover: ${_week.first.avgCloudCover()}%'
                    ),
                    RowWithIcon(
                      imageLink: 'assets/gif/date.gif',
                      text: 'Date: ${
                        DateTime.now().year.toString()}-${
                          DateTime.now().month.toString()}-${
                            DateTime.now().day.toString()}'
                    )
                  ],
                )
              ),
            );
          }else{
            contant = Container();
            angle = 0 * pi / 180;
          }
        });
      },
      child:  Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child : Container(
              width: 370,
              height: 50,
              decoration: boxDecorationAsset(),
              child : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LableText(
                    text: 'More information'
                  ),
                  Transform.rotate(
                    angle: angle,
                    child: const Icon(
                      Icons.arrow_right
                    )
                  )
                ]
              )
            )
          ),
          contant 
        ]
      )
    );
  }
}