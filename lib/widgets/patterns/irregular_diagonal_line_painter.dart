import 'dart:math';
import 'package:flutter/material.dart';

import 'package:patterns/services/utils.dart';

class IrregularDiagonalLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Random random = Random();

    // 선택 가능한 값 목록
    List<double> gapValues = [3, 4, 6, 8];

    double gap = gapValues[0]; // 간격

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
    while (i < size.width * 2) {
      // 랜덤 간격 선택
      int randomIndex = random.nextInt(gapValues.length);
      double gap = gapValues[randomIndex];
      if (i > size.width) {
        canvas.drawLine(Offset(size.width, i-size.width), Offset(i-size.width, size.height), paint);
        canvas.drawLine(Offset(0, i-size.width), Offset(size.width - (i-size.width), size.height), paint);
      }
      else {
        canvas.drawLine(Offset(i, 0), Offset(0, i), paint);
        canvas.drawLine(Offset(size.width - i, 0), Offset(size.width, i), paint);
      }


      // 왼쪽 하단에서 오른쪽 상단으로 그리는 라인
      // canvas.drawLine(
      //     Offset(i, size.height),
      //     Offset(i + gap, size.height - gap),
      //     paint
      // );
      // canvas.drawLine(
      //     Offset(size.width - i, 0),
      //     Offset(size.width - (i + gap), gap),
      //     paint
      // );

      // 다음 간격으로 이동
      i += gap;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // 항상 다시 그리도록 설정
    return true;
  }
}