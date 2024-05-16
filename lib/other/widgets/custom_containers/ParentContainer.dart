import 'package:flutter/material.dart';
import 'package:just_weather/other/functions/boxDecorationAsset.dart';

abstract class ParentContainer extends StatelessWidget {

  final Widget? child; 
  final double height;
  final double width;

  const ParentContainer({
    super.key, 
    required this.child,
    required this.height,
    required this.width
  });

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double containerWidth = screenWidth * width;
    double containerHeight = screenHeight * height;

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        alignment: Alignment.center,
        width: containerWidth,
        height: containerHeight,
        decoration: boxDecorationAsset(),
        child: child,
      )
    );
  }
}