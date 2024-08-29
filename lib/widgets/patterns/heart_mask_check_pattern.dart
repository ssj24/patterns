import 'dart:math';

import 'package:flutter/material.dart';
import 'package:patterns/services/circle_clipper.dart';
import 'package:patterns/services/heart_clipper.dart';
import 'package:patterns/widgets/painters/grid_pattern_painter.dart';

import '../painters/heart_outline_painter.dart';
import '../painters/irregular_diagonal_line_painter.dart';

class HeartMaskCheckPattern extends StatelessWidget {
  const HeartMaskCheckPattern({
    super.key,
  });


  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.deepOrange,)
        ),
        child: Center(
          child: Stack(
            children: [
              Container(
                width: 200, // Container width
                height: 200, // Container height
                child: ClipPath(
                  clipper: HeartClipper(),
                  child: CustomPaint(
                    size: Size(200, 200), // 캔버스 크기
                    painter: GridPatternPainter(targetColor: Colors.deepOrange),
                  ),
                ),
              ),
              Container(
                width: 200,
                height: 200,
                child: CustomPaint(
                  size: Size(200, 200),
                  painter: HeartOutlinePainter(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}