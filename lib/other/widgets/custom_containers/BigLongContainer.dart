import 'package:flutter/material.dart';
import 'package:just_weather/other/widgets/custom_containers/ParentContainer.dart';


class BigLongContainer extends ParentContainer {
  final Widget? child;

  const BigLongContainer({
    super.key, 
    required this.child, 
    height, 
    width
  }) : super(
    child: child,
    height: 0.26,
    width: 0.9,
  );
}