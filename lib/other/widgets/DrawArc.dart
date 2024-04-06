import 'package:flutter/material.dart';

class DrawArc extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..shader = const RadialGradient(
        colors: [
          Colors.yellow,
          Colors.blue,
          Colors.black
        ]
      ).createShader(
        Rect.fromCircle(
          center: Offset.zero,
          radius: 400
        )
      )
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    canvas.drawArc(
      const Offset(-105, 35) & const Size(200, 200),
      3.45,
      2.5, 
      false,
      paint
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}