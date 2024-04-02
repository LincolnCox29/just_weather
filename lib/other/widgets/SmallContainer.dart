import 'package:flutter/material.dart';
import 'package:just_weather/other/functions/boxDecorationAsset.dart';

class SmallContainer extends StatelessWidget {

  final Widget child; 
  const SmallContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        alignment: Alignment.center,
        width: 125,
        height: 100,
        decoration: boxDecorationAsset(),
        child: child,
      )
    );
  }
}