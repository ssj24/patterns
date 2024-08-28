import 'package:flutter/material.dart';
import 'package:patterns/widgets/painters/opacity_grid_pattern_painter.dart';
import 'package:patterns/widgets/painters/two_type_check_pattern_painter.dart';

import '../painters/irregular_diagonal_line_painter.dart';

class OpacityGridPattern extends StatelessWidget {
  const OpacityGridPattern({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
          children: [
            CustomPaint(
              size: Size(200, 300), // 캔버스 크기
              painter: OpacityGridPatternPainter(targetColor: Colors.pinkAccent),
            ),
          ]
      ),
    );
  }
}