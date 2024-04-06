import 'package:flutter/material.dart';
import 'package:just_weather/other/functions/boxDecorationAsset.dart';

abstract class ParentContainer extends StatelessWidget {

  final Widget? child; 
  final double? height;
  final double? width;

  const ParentContainer({
    super.key, 
    required this.child,
    required this.height,
    required this.width
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        decoration: boxDecorationAsset(),
        child: child,
      )
    );
  }
}