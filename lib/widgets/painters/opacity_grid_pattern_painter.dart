import 'dart:math';
import 'package:flutter/material.dart';

import 'package:patterns/services/utils.dart';

class OpacityGridPatternPainter extends CustomPainter {
  final Color targetColor;
  OpacityGridPatternPainter({required this.targetColor});

  @override
  void paint(Canvas canvas, Size size) {
    Random random = Random();

    // 선택 가능한 값 목록
    List<Color> colorValues = [
      targetColor.withOpacity(0.01),
      targetColor.withOpacity(0.9),
      targetColor.withOpacity(0.3),
      targetColor.withOpacity(0.0),
      targetColor.withOpacity(0.9),
      targetColor.withOpacity(0.05),
      targetColor.withOpacity(0.3),
      targetColor.withOpacity(0.2),
      targetColor.withOpacity(0.9),
      targetColor.withOpacity(0.2),
      targetColor.withOpacity(0.01),
      targetColor.withOpacity(0.9),
      targetColor.withOpacity(0.0)];
    List<double> widths = [20.0, 2.0, 4.0, 2.0, 2.0, 3.0, 12.0, 3.0, 2.0, 13.0, 24.0, 2.0, 25.0];

    int curIdx = 0;
    double i = 0.0;
    // 페인트 객체 생성
    Paint paint = Paint()
    // ..color = getRandomColor().withOpacity(0.3) // 라인 색상
      ..color = Colors.transparent // 라인 색상
      ..strokeWidth = 20.0; // 라인 두께

    while (i < size.height) {
      if (i > size.width) {
        canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
        // canvas.drawLine(Offset(i, 0), Offset(i, size.width), paint);
      }
      else {
        canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
        canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
      }
      curIdx = curIdx == 12 ? 0 : curIdx+1;
      paint.color = colorValues[curIdx];
      paint.strokeWidth = widths[curIdx];
      i += [1, 2, 4, 5, 8, 9, 11, 12].contains(curIdx) ? widths[curIdx - 1] : curIdx % 2 == 0 ? 4.0 + widths[curIdx] / 2: 16.0 ;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // 항상 다시 그리도록 설정
    return true;
  }
}