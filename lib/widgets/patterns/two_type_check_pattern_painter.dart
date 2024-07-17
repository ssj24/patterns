import 'package:flutter/material.dart';


class TwoTypeCheckPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    List<Color> colors = [Colors.deepPurple.withOpacity(0.5), Colors.transparent, Colors.red.withOpacity(0.3), Colors.transparent];
    List<double> widths = [1.0, 5.0, 5.0, 5.0];
    Paint paint = Paint()
      ..color = colors[0] // 라인 색상
      ..strokeWidth = widths[0]; // 라인 두께
    int curIdx = 0;
    double i = 0.0;
    while (i < size.width * 2) {
      if (i > size.width) {
        canvas.drawLine(Offset(size.width, i-size.width), Offset(i-size.width, size.height), paint);
        canvas.drawLine(Offset(0, i-size.width), Offset(size.width - (i-size.width), size.height), paint);
      }
      else {
        canvas.drawLine(Offset(i, 0), Offset(0, i), paint);
        canvas.drawLine(Offset(size.width - i, 0), Offset(size.width, i), paint);
      }
      curIdx = curIdx == 3 ? 0 : curIdx+1;
      paint.color = colors[curIdx];
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