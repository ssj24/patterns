import 'package:flutter/material.dart';

import 'package:patterns/services/utils.dart';

class PlaidPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    List<Color> colors = [
      Colors.deepPurpleAccent.shade400,
      Colors.transparent,
    ];
    int totalRow = 20;
    int totalCol = 15;
    double squareWidth = size.width / totalCol;
    Paint paint = Paint();
    for (int row = 0; row < totalRow; row++) {
      for (int col = 0; col < totalCol; col++) {
        // Check the condition to fill the cell with the pattern color
        if ((row % 2 == 0 && col % 2 != 0) || (row % 2 != 0 && col % 2 == 0)) {
          paint.color = colors[0];
        } else {
          paint.color = colors[1];
        }

        // Draw the rectangle
        canvas.drawRect(
          Rect.fromLTWH(col * squareWidth, row * squareWidth, squareWidth, squareWidth),
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // 항상 다시 그리도록 설정
    return true;
  }
}
