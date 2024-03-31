import 'package:flutter/material.dart';
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
  bool isActive = false;

  @override
  void initState(){
    super.initState();
    setState(() {
      _week = widget.week;
      _hour = widget.hour;
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
          contant = Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child : Container(
              width: 370,
              height: 210,
              decoration: boxDecorationAsset(),
              child: Column(
                children: [
                  RowWithIcon(
                    imageLink: 'assets/gif/hot.gif', 
                    text: 'Average temperature: ${_week.first.avgTemperature()}°'
                  ),
                  RowWithIcon(
                    imageLink: 'assets/gif/wind.gif',
                    text: 'Wind speed (now): ${_week.first.windSpeed[_hour]} m/s'
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
          }
        });
      },
      child:  Column(
        children: [
          LableText(
            text: 'More information'
          ),
          contant 
        ]
      )
    );
  }
}