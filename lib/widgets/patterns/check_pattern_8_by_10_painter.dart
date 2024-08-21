import 'package:flutter/material.dart';

import 'package:patterns/services/utils.dart';

class CheckPattern8By10Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    List<Color> colors = [
      Colors.orangeAccent.shade400,
      Colors.transparent,
    ];
    List<int> widths = [8, 10];
    Paint paint = Paint()
      ..color = colors[0] // 라인 색상
      ..strokeWidth = 1; // 라인 두께
    int curIdx = 0;
    int count = 1;
    double i = 0.0;
    while (i < size.width * 2) {
      if (i > size.width) {
        canvas.drawLine(Offset(size.width, i - size.width),
            Offset(i - size.width, size.height), paint);
        canvas.drawLine(Offset(0, i - size.width),
            Offset(size.width - (i - size.width), size.height), paint);
      } else {
        canvas.drawLine(Offset(i, 0), Offset(0, i), paint);
        canvas.drawLine(
            Offset(size.width - i, 0), Offset(size.width, i), paint);
      }
      count += 1;
      if (curIdx == 0 && count == widths[0]) {
        curIdx = 1;
        count = 0;
      } else if (curIdx == 1 && count == widths[1]) {
        curIdx = 0;
        count = 0;
      }

      paint.color = colors[curIdx];
      i += 4;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // 항상 다시 그리도록 설정
    return true;
  }
}
