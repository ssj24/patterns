import 'dart:math';
import 'package:flutter/material.dart';

import 'package:patterns/services/utils.dart';

class CircleMaskPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Random random = Random();

    // 선택 가능한 값 목록
    List<Color> colorValues = [Colors.purple.shade100, Colors.purple.shade200,Colors.purple.shade300, Colors.purple.shade400, Colors.purple.shade500, Colors.purple.shade600, Colors.purple.shade700, Colors.purple.shade800, Colors.purple.shade900];

    // 페인트 객체 생성
    Paint paint = Paint()
      // ..color = getRandomColor().withOpacity(0.3) // 라인 색상
      ..color = Color(0xffFB8281) // 라인 색상
      ..strokeWidth = 1.0; // 라인 두께
    double i = 0.0;
    // 대각선 라인 그리기
    // for (double i = 0; i < size.width; i += gap) {
    //   int randomIndex = random.nextInt(gapValues.length);
    //   gap = gapValues[randomIndex];
    //   // 왼쪽 상단에서 오른쪽 하단으로 그리는 라인
    //   canvas.drawLine(Offset(i, 0), Offset(0, i), paint);
    //   // 오른쪽 상단에서 왼쪽 하단으로 그리는 라인
    //   canvas.drawLine(Offset(size.width, i), Offset(i, size.height), paint);
    //   // 왼쪽 상단에서 오른쪽 하단으로 그리는 라인
    //   canvas.drawLine(Offset(size.width-i, 0), Offset(size.width, i), paint);
    //   // 오른쪽 상단에서 왼쪽 하단으로 그리는 라인
    //   canvas.drawLine(Offset(0, i), Offset(size.width-i, size.height), paint);
    // }
    // while (i < size.width) {
    //   // 랜덤 간격 선택
    //   int randomIndex = random.nextInt(gapValues.length);
    //   double gap = gapValues[randomIndex];
    //
    //   // 왼쪽 상단에서 오른쪽 하단으로 그리는 라인
    //   canvas.drawLine(Offset(i, 0), Offset(0, i), paint);
    //   // 오른쪽 상단에서 왼쪽 하단으로 그리는 라인
    //   canvas.drawLine(Offset(size.width, i), Offset(i, size.height), paint);
    //   // 왼쪽 상단에서 오른쪽 하단으로 그리는 라인 (반대 방향)
    //   canvas.drawLine(Offset(size.width - i, 0), Offset(size.width, i), paint);
    //   // 오른쪽 상단에서 왼쪽 하단으로 그리는 라인 (반대 방향)
    //   canvas.drawLine(Offset(0, i), Offset(size.width - i, size.height), paint);
    //
    //   // 다음 간격으로 이동
    //   i += gap;
    // }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // 항상 다시 그리도록 설정
    return true;
  }
}