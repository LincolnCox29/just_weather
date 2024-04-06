import 'package:flutter/material.dart';
import 'package:just_weather/other/widgets/custom_containers/ParentContainer.dart';

class SmallContainer extends ParentContainer {
  final Widget? child;

  const SmallContainer({
    super.key, 
    required this.child, 
    height, 
    width
  }) : super(
    height: 125,
    width: 125,
    child: child
  );
}