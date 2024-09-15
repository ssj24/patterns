import 'package:flutter/material.dart';
import 'package:patterns/widgets/painters/plaid_pattern_painter.dart';

import '../painters/rough_circle_painter.dart';

class RoughCircle extends StatelessWidget {
  const RoughCircle({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      child: Stack(
          children: [
            CustomPaint(
              size: Size(200, 250), // 캔버스 크기
              painter: RoughCirclePainter(rows: 11, cols: 6),
            ),
          ]
      ),
    );
  }
}