import 'package:flutter/material.dart';
import 'package:just_weather/other/widgets/custom_containers/ParentContainer.dart';

class BigContainer extends ParentContainer {
  final Widget? child;

  const BigContainer({
    super.key, 
    required this.child, 
    height, 
    width
  }) : super(
    child: child,
    height: 0.25,
    width: 0.5,
  );
}