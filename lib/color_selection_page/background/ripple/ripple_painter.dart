import 'dart:math';

import 'package:flutter/material.dart';

class RipplePainter extends CustomPainter {
  const RipplePainter(this.color, this.radiusMultiplier);

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = Offset(size.width / 2.0, size.height / 2.0);
    final double radius = _calcRadius(size);
    final Paint paint = Paint();
    paint.shader = _gradientShader(radius);

    canvas.drawCircle(center, radius, paint);
  }

  double _calcRadius(Size size) {
    return max(size.width, size.height);
  }

  Shader _gradientShader(double radius) {
    return LinearGradient(
      colors: <Color>[color[1], color[0]],
      //stops: const <double>[0.8, 0.3],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    ).createShader(Rect.fromCircle(center: Offset.zero, radius: radius));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  final List<Color> color;
  final double radiusMultiplier;
}
