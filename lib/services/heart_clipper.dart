import 'dart:math';

import 'package:flutter/material.dart';

class HeartClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final width = size.width;
    final height = size.height;

    path.moveTo(0.5 * width, height * 0.25);
    path.cubicTo(
        0.1 * width, height * -0.25,
        -0.25 * width, height * 0.6,
        0.5 * width, height*0.8);
    path.moveTo(0.5 * width, height * 0.25);
    path.cubicTo(
        0.9 * width, height * -0.25,
        1.25 * width, height * 0.6,
        0.5 * width, height*0.8);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}