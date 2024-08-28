import 'dart:math';
import 'package:flutter/material.dart';

import 'package:patterns/services/utils.dart';

class CircleMaskPatternPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Random random = Random();

    // 선택 가능한 값 목록
    List<Color> colorValues = [Colors.purple.shade100, Colors.purple.shade200,Colors.purple.shade300, Colors.purple.shade400, Colors.purple.shade500, Colors.purple.shade600, Colors.purple.shade700, Colors.purple.shade800, Colors.purple.shade900];
    List<double> widths = [1.0, 5.0, 5.0, 5.0];

    int curIdx = 0;
    double i = 0.0;
    // 페인트 객체 생성
    Paint paint = Paint()
    // ..color = getRandomColor().withOpacity(0.3) // 라인 색상
      ..color = Color(0xffFB8281) // 라인 색상
      ..strokeWidth = 1.0; // 라인 두께
    // it displays sort of diagonal
    while (i < size.height) {
      if (i > size.width) {
        canvas.drawLine(Offset(0, i), Offset(0, size.width), paint);
        // canvas.drawLine(Offset(i, 0), Offset(i, size.width), paint);
      }
      else {
        canvas.drawLine(Offset(i, i), Offset(size.width, i), paint);
        // canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
      }
      curIdx = curIdx == 3 ? 0 : curIdx+1;
      paint.color = colorValues[curIdx];
      paint.strokeWidth = widths[curIdx];
      i += 5.0;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // 항상 다시 그리도록 설정
    return true;
  }
}