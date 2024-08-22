import 'package:flutter/material.dart';

import 'irregular_diagonal_line_painter.dart';

class CircleMaskPattern extends StatelessWidget {
  const CircleMaskPattern({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
          children: [
            CustomPaint(
              size: Size(200, 200), // 캔버스 크기
              painter: IrregularDiagonalLinePainter(),
            ),
            Positioned(
                left: 32,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Transform.scale(
                    scaleX: 2,
                    scaleY: 3,
                    child: Text(
                      '<<<<<',
                      style: TextStyle(
                        // backgroundColor: Colors.white,
                        // fontWeight: FontWeight.w900,
                          color: Colors.white,
                          // shadows: <Shadow>[
                          //   Shadow(
                          //     offset: Offset(0.0, 0.0),
                          //     blurRadius: 2.0,
                          //     color: Color.fromARGB(120, 0, 0, 0),
                          //   ),
                          // ],
                          fontSize: 20,
                          letterSpacing: 1
                        // height: 24,
                      ),
                    ),
                  ),
                )
            ),
            Positioned(
                bottom: 0,
                right: 32,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Transform.scale(
                    scaleX: 2,
                    scaleY: 3,
                    child: Text(
                      '>>>>>',
                      style: TextStyle(
                        // backgroundColor: Colors.white,
                        // fontWeight: FontWeight.w900,
                          color: Colors.white,
                          fontSize: 20,
                          letterSpacing: 1
                        // height: 24,
                      ),
                    ),
                  ),
                )
            ),
          ]
      ),
    );
  }
}