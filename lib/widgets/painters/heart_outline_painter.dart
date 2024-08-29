import 'package:flutter/material.dart';

class HeartOutlinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width;
    double height = size.height;

    Path path = Path();
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

    Paint outlinePaint = Paint()
      ..color = Colors.deepOrange
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2.0; // Outline thickness

    canvas.drawPath(path, outlinePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
