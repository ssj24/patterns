import 'package:flutter/material.dart';
import 'package:patterns/widgets/painters/plaid_pattern_painter.dart';

class PlaidPattern extends StatelessWidget {
  const PlaidPattern({
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
              painter: PlaidPatternPainter(),
            ),
          ]
      ),
    );
  }
}