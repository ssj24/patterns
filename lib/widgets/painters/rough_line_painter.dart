import 'dart:math';

import 'package:flutter/material.dart';

import 'package:patterns/services/utils.dart';

class RoughLinePainter extends CustomPainter {
  final Random random = Random();
  final int rows;
  RoughLinePainter({required this.rows});
  @override
  void paint(Canvas canvas, Size size) {
    List<Color> colors = [
      Colors.deepPurple.shade300,
      Colors.orange.shade200,
      Colors.orange.shade100,
      Colors.deepPurple.shade100,
      Colors.deepPurple.shade200,
    ];
    int curIdx = 0;
    final paint = Paint()
      ..color = colors[curIdx]
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    double lineHeight = size.height / rows;

    for (int row = 0; row < rows - 1; row++) {

        // Create a path for the rough circle
        Path path = Path();

        //Move to the start point at the top of the circle
        path.moveTo(
          0,
          lineHeight + lineHeight * row,
        );
        // Draw a curve that dips down in the middle
        path.quadraticBezierTo(
          size.width / 2, // Control point's x
          lineHeight + lineHeight * row + 2, // Control point's y (lower to create the dip)
          size.width, // End point's x
          lineHeight+ lineHeight * row, // End point's y
        );

        // path.lineTo(
        //   size.width,
        //   lineHeight + lineHeight * row,
        // );

        // with this command, I could see the two different line
        // dipped down one and straight one
        // path.close();

        // Draw the rough circle path
        canvas.drawPath(path, paint);
        curIdx = curIdx == 4 ? 0 : curIdx + 1;
        paint.color = colors[curIdx];
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // 항상 다시 그리도록 설정
    return true;
  }
}
