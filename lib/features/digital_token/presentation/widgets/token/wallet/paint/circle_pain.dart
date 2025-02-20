import 'package:flutter/material.dart';

class CircleBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white.withAlpha(25)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final Offset center = Offset(size.width * 0.3, size.height * 0.8);

    for (int i = 1; i <= 4; i++) {
      canvas.drawCircle(center, size.width * 0.2 * i, paint);
    }
  }

  @override
  bool shouldRepaint(CircleBackgroundPainter oldDelegate) => false;
}