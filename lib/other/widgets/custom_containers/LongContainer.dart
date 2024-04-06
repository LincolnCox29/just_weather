import 'package:flutter/material.dart';
import 'package:just_weather/other/widgets/custom_containers/ParentContainer.dart';

class LongContainer extends ParentContainer {
  final Widget? child;

  const LongContainer({
    super.key, 
    required this.child, 
    height, 
    width
  }) : super(
    height: 110,
    width: 370,
    child: child
  );
}