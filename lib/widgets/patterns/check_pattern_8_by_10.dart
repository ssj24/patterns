import 'package:flutter/material.dart';
import 'package:patterns/widgets/patterns/two_type_check_pattern_painter.dart';

import 'check_pattern_8_by_10_painter.dart';
import 'irregular_diagonal_line_painter.dart';

class CheckPattern8By10 extends StatelessWidget {
  const CheckPattern8By10({
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
              size: Size(200, 200), // 캔버스 크기
              painter: CheckPattern8By10Painter(),
            ),
          ]
      ),
    );
  }
}