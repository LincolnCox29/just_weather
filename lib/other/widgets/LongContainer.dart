import 'package:flutter/material.dart';
import 'package:just_weather/other/functions/boxDecorationAsset.dart';

class LongContainer extends StatelessWidget {

  final Widget child; 
  const LongContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        alignment: Alignment.center,
        width: 370,
        height: 110,
        decoration: boxDecorationAsset(),
        child: child,
      )
    );
  }
}