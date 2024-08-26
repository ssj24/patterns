import 'dart:math';

import 'package:flutter/material.dart';
import 'package:patterns/widgets/patterns/circle_mask_pattern_painter.dart';

import 'irregular_diagonal_line_painter.dart';

class CircleMaskPattern extends StatelessWidget {
  const CircleMaskPattern({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    var random = Random();


    // 선택 가능한 값 목록
    List<Color> colorValues = [Colors.purple.shade100, Colors.purple.shade200,Colors.purple.shade300, Colors.purple.shade400, Colors.purple.shade500, Colors.purple.shade600, Colors.purple.shade700, Colors.purple.shade800, Colors.purple.shade900];

    return Center(
      child: Stack(
          children: [
            CustomPaint(
              size: Size(200, 300), // 캔버스 크기
              painter: CircleMaskPatternPainter(),
            ),
            ...colorValues.asMap().entries.map((entry) {
              int index = entry.key;
              var color = entry.value;
              double randomWidth = Random().nextDouble() * 30;
              double randomTop = Random().nextDouble() * 299;
              double randomLeft = Random().nextDouble() * 199;

              return Positioned(
                top: randomTop,
                left: randomLeft,
                child: Container(
                  width: randomWidth,
                  height: randomWidth,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(90)
                  ),
                ),
              );
            }).toList(),
          ]
      ),
    );
  }
}