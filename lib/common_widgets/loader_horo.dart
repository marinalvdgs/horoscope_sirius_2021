import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArcPainter extends CustomPainter {

  final double angle;
  final Color color;

  ArcPainter({required this.angle, required this.color});


  double doubleToAngle(double angle) => angle * pi / 180.0;

  @override
  bool shouldRepaint(ArcPainter oldDelegate) {
    return true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromLTWH(0.0, 0.0, size.width, size.height);
    canvas.drawArc(
        rect,
        -pi / 2,
        doubleToAngle(angle),
        false,
        Paint()
          ..color = color
          ..strokeWidth = 5.0
          ..style = PaintingStyle.stroke
    );
    canvas.drawPath(
      Path()
        ..addArc(
        rect,
        -pi / 2,
        doubleToAngle(angle)),
        Paint()
          ..color = color
          ..strokeWidth = 5.0
          ..style = PaintingStyle.stroke
          ..maskFilter = const MaskFilter.blur(BlurStyle.outer, 5.5)
    );
  }
}