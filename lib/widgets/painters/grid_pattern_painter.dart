import 'dart:math';
import 'package:flutter/material.dart';

import 'package:patterns/services/utils.dart';

class GridPatternPainter extends CustomPainter {
  final Color targetColor;
  GridPatternPainter({this.targetColor = Colors.purple});
  @override
  void paint(Canvas canvas, Size size) {
    Random random = Random();

    // Generate different shades by adjusting lightness
    Color shade100 = HSLColor.fromColor(targetColor).withLightness(0.9).toColor();
    Color shade200 = HSLColor.fromColor(targetColor).withLightness(0.8).toColor();
    Color shade400 = HSLColor.fromColor(targetColor).withLightness(0.6).toColor();
    Color shade500 = targetColor; // The base color itself
    Color shade600 = HSLColor.fromColor(targetColor).withLightness(0.5).toColor();
    Color shade700 = HSLColor.fromColor(targetColor).withLightness(0.4).toColor();
    Color shade800 = HSLColor.fromColor(targetColor).withLightness(0.3).toColor();
    Color shade900 = HSLColor.fromColor(targetColor).withLightness(0.2).toColor();
    // 선택 가능한 값 목록
    List<Color> colorValues = [shade100, shade200, shade400, shade500, shade600, shade700, shade800, shade900];
    List<double> widths = [1.0, 3.0, 7.0, 8.0];

    int curIdx = 0;
    double i = 0.0;
    // 페인트 객체 생성
    Paint paint = Paint()
    // ..color = getRandomColor().withOpacity(0.3) // 라인 색상
      ..color = Color(0xffFB8281) // 라인 색상
      ..strokeWidth = 1.0; // 라인 두께
    Paint paint2 = Paint()
    // ..color = getRandomColor().withOpacity(0.3) // 라인 색상
      ..color = Color(0xffFB8281) // 라인 색상
      ..strokeWidth = 1.0; // 라인 두께
    while (i < size.height) {
      if (i > size.width) {
        canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
        // canvas.drawLine(Offset(i, 0), Offset(i, size.width), paint);
      }
      else {
        canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
        canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint2);
      }
      curIdx = curIdx == 3 ? 0 : curIdx+1;
      paint.color = colorValues[curIdx].withOpacity(0.2);
      paint.strokeWidth = widths[curIdx];
      paint2.color = colorValues[3 - curIdx].withOpacity(0.2);
      paint2.strokeWidth = widths[3 - curIdx];
      i += 5.0;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // 항상 다시 그리도록 설정
    return true;
  }
}