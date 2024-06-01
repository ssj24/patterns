import 'package:flutter/material.dart';

class CheckPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // 체크 패턴의 각 사각형 크기
    double rectSize = 20.0;

    // 페인트 객체 생성
    Paint paint = Paint()
      ..color = Colors.black // 사각형 색상
      ..style = PaintingStyle.fill;

    // 캔버스에 체크 패턴 그리기
    for (double y = 0; y < size.height; y += rectSize * 2) {
      for (double x = 0; x < size.width; x += rectSize * 2) {
        // 첫 번째 사각형
        canvas.drawRect(Rect.fromLTWH(x, y, rectSize, rectSize), paint);
        // 두 번째 사각형
        if (x + rectSize < size.width && y + rectSize < size.height) {
          canvas.drawRect(Rect.fromLTWH(x + rectSize, y + rectSize, rectSize, rectSize), paint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // 항상 다시 그리도록 설정
    return true;
  }
}