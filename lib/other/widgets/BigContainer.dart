import 'package:flutter/material.dart';
import 'package:just_weather/other/functions/boxDecorationAsset.dart';

class BigContainer extends StatelessWidget {

  final Widget child; 
  const BigContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        alignment: Alignment.center,
        width: 200,
        height: 216,
        decoration: boxDecorationAsset(),
        child: child,
      )
    );
  }
}