import 'package:flutter/material.dart';

class BottomAppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, 0);

    double adjustedHeight = size.height - 20;
    
    // Left side curve
    path.lineTo(size.width * 0.375, 0);
    path.quadraticBezierTo(
      size.width * 0.391875, adjustedHeight * 0.054,
      size.width * 0.4, adjustedHeight * 0.1
    );

    // Bottom curve
    path.cubicTo(
      size.width * 0.445, adjustedHeight * 0.6,
      size.width * 0.555, adjustedHeight * 0.6,
      size.width * 0.6, adjustedHeight * 0.1
    );

    // Right side curve (mirrored from left side)
    path.quadraticBezierTo(
      size.width * 0.608125, adjustedHeight * 0.054,
      size.width * 0.625,0
    );
    
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}