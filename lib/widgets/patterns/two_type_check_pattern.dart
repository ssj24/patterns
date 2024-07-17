import 'package:flutter/material.dart';
import 'package:patterns/widgets/patterns/two_type_check_pattern_painter.dart';


class TwoTypeCheckPattern extends StatelessWidget {
  const TwoTypeCheckPattern({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          CustomPaint(
            size: const Size(200, 200), // 캔버스 크기
            painter: TwoTypeCheckPatternPainter(),
          ),
          const Positioned(
              top: 40,
              left: 22,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  '+',
                  style: TextStyle(
                    // backgroundColor: Colors.white,
                    // fontWeight: FontWeight.w900,
                      color: Colors.pinkAccent,
                      fontSize: 24,
                      letterSpacing: 1
                    // height: 24,
                  ),
                ),
              )
          ),
          const Positioned(
              top: 80,
              left: 10,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  '+',
                  style: TextStyle(
                    // backgroundColor: Colors.white,
                    // fontWeight: FontWeight.w900,
                      color: Colors.pinkAccent,
                      fontSize: 24,
                      letterSpacing: 1
                    // height: 24,
                  ),
                ),
              )
          ),
          const Positioned(
              top: 100,
              left: 5,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  '+',
                  style: TextStyle(
                    // backgroundColor: Colors.white,
                    // fontWeight: FontWeight.w900,
                      color: Colors.pinkAccent,
                      fontSize: 24,
                      letterSpacing: 1
                    // height: 24,
                  ),
                ),
              )
          ),
          const Positioned(
              bottom: 14,
              left: 10,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  '+',
                  style: TextStyle(
                    // backgroundColor: Colors.white,
                    // fontWeight: FontWeight.w900,
                      color: Colors.pinkAccent,
                      fontSize: 24,
                      letterSpacing: 1
                    // height: 24,
                  ),
                ),
              )
          ),
        ]
    );
  }
}