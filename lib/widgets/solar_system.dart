import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class SolarSystem extends StatefulWidget {
  const SolarSystem({super.key});

  @override
  State<SolarSystem> createState() => _SolarSystemState();
}

class _SolarSystemState extends State<SolarSystem> with TickerProviderStateMixin {
  late AnimationController _starController;
  late AnimationController _starShimeringController;
  late Animation<double> _opacityAnimation1;
  late Animation<double> _opacityAnimation2;
  late Animation<double> _opacityAnimation3;
  List<Widget> _smallWidgets = [];
  List<Widget> _mediumWidgets = [];
  List<Widget> _largeWidgets = [];
  List<int> starPeriods = [2, 5, 13];
  List<int> starCounts = [50, 20, 10];
  @override
  void initState() {
    super.initState();
    _starController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat();
    _starShimeringController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat(reverse: true);
    _opacityAnimation1 = Tween<double>(begin: 0.8, end: 0.3).animate(_starShimeringController);
    _opacityAnimation2 = Tween<double>(begin: 0.3, end: 0.5).animate(_starShimeringController);
    _opacityAnimation3 = Tween<double>(begin: 0.1, end: 0.7).animate(_starShimeringController);

    _smallWidgets = _generatePositionedSmallWidgets(starCounts[0]);
    _mediumWidgets = _generatePositionedMediumWidgets(starCounts[1]);
    _largeWidgets = _generatePositionedLargeWidgets(starCounts[2]);
    for (var i=0; i<starPeriods.length; i++) {
      Timer.periodic(Duration(seconds: starPeriods[i]), (Timer timer) {
        setState(() {
          if (i == 0) {
            _smallWidgets = _generatePositionedSmallWidgets(starCounts[i]);
          } else if (i == 1) {
            _mediumWidgets = _generatePositionedMediumWidgets(starCounts[i]);
          } else {
            _largeWidgets = _generatePositionedLargeWidgets(starCounts[i]);
          }
        });
      });
    }
  }

  @override
  void dispose() {
    _starController.dispose();
    _starShimeringController.dispose();
    super.dispose();
  }

  List<Positioned> _generatePositionedSmallWidgets(int count) {
    return List<Positioned>.generate(count, (index) {
      double top = Random().nextDouble() * 400; // Random top position between 0 and 200
      double left = Random().nextDouble() * 400;
      double width = Random().nextDouble() * 7;
      double customOpacity = Random().nextDouble();
      return Positioned(
        top: top,
        left: left,
        child: AnimatedBuilder(
          animation: _starShimeringController,
          builder: (context, child) {
            return Opacity(
              opacity: _opacityAnimation1.value,
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity(),
                  // ..scale(_scaleAnimation.value)
                  // ..rotateZ(_rotationAnimation.value),
                child: Container(
                    width: width,
                    height: width,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(customOpacity),
                        borderRadius: BorderRadius.circular(50)
                    )
                ),
              ),
            );
          },
        ),
      );
    });
  }
  List<Positioned> _generatePositionedMediumWidgets(int count) {
    return List<Positioned>.generate(count, (index) {
      double value = Random().nextDouble();
      double top = Random().nextDouble() * 400; // Random top position between 0 and 200
      double left = Random().nextDouble() * 400;
      double width = value * 13;
      double customOpacity = value > 0.5 ? value - 0.45 : value;
      return Positioned(
        top: top,
        left: left,
        child: AnimatedBuilder(
          animation: _starShimeringController,
          builder: (context, child) {
            return Opacity(
              opacity: _opacityAnimation2.value,
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity(),
                // ..scale(_scaleAnimation.value)
                // ..rotateZ(_rotationAnimation.value),
                child: Container(
                  width: width,
                  height: width,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(customOpacity),
                      borderRadius: BorderRadius.circular(50)
                  ),
                ),
              ),
            );
          }
        ),
      );
    });
  }
  List<Positioned> _generatePositionedLargeWidgets(int count) {
    return List<Positioned>.generate(count, (index) {
      double value = Random().nextDouble();
      double top = Random().nextDouble() * 400; // Random top position between 0 and 200
      double left = Random().nextDouble() * 400;
      double width = value * 15;
      double customOpacity = value > 0.5 ? value - 0.495 : value;
      return Positioned(
        top: top,
        left: left,
        child: AnimatedBuilder(
          animation: _starShimeringController,
          builder: (context, child)
      {
        return Opacity(
          opacity: _opacityAnimation3.value,
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity(),
            // ..scale(_scaleAnimation.value)
            // ..rotateZ(_rotationAnimation.value),
            child: Container(
              width: width,
              height: width,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(customOpacity),
                  borderRadius: BorderRadius.circular(50)
              ),
            ),
          ),
        );
      }
      )
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.indigo.shade900,
      ),
      child: SizedBox(
        width: 400,
        height: 400,
        child: Stack(
          children: [
            ..._smallWidgets,
            ..._mediumWidgets,
            ..._largeWidgets,
            Positioned(
              left: -200,
              top: 50,
              child: Transform.rotate(
                angle: -0.03,
                child: CustomPaint(
                  size: const Size(500, 300),
                  painter: OvalBorderPainter(
                    borderColor: Colors.white,
                    borderWidth: 2,
                  ),
                ),
              )
            ),
            Positioned(
              left: -200,
              top: 50,
              child: SizedBox(
              width: 500,
              height: 300,
              child: AnimatedBuilder(
                animation: _starController,
                builder: (context, child) {
                  final angle = _starController.value * 2 * pi;
                  final x = 250 + 230 * cos(angle);
                  final y = 150 + 140 * sin(angle);
                  return Stack(
                    children: [
                      Positioned(
                        left: x - 10,
                        top: y - 10,
                        child: child!,
                      ),
                    ],
                  );
                },
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            )
            ),
            Positioned(
                left: -150,
                top: 75,
                child: Transform.rotate(
                  angle: -0.03,
                  child: CustomPaint(
                    size: const Size(420, 250),
                    painter: OvalBorderPainter(
                      borderColor: Colors.white,
                      borderWidth: 2,
                    ),
                  ),
                )
            ),
            Positioned(
              left: 200,
              top: 118,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.yellow.shade900,
                  borderRadius: BorderRadius.circular(50)
                ),
              ),
            ),
            Positioned(
                left: -130,
                top: 90,
                child: Transform.rotate(
                  angle: -0.03,
                  child: CustomPaint(
                    size: const Size(380, 220),
                    painter: OvalBorderPainter(
                      borderColor: Colors.white,
                      borderWidth: 2,
                    ),
                  ),
                )
            ),
            Positioned(
                left: -200,
                top: 50,
                child: SizedBox(
                  width: 500,
                  height: 300,
                  child: AnimatedBuilder(
                    animation: _starController,
                    builder: (context, child) {
                      final angle = _starController.value * 2 * pi;
                      final x = 250 + 180 * cos(angle);
                      final y = 150 + 100 * sin(angle);
                      return Stack(
                        children: [
                          Positioned(
                            left: x - 10,
                            top: y - 10,
                            child: child!,
                          ),
                        ],
                      );
                    },
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                )
            ),
            Positioned(
                left: -110,
                top: 100,
                child: Transform.rotate(
                  angle: -0.03,
                  child: CustomPaint(
                    size: const Size(340, 200),
                    painter: OvalBorderPainter(
                      borderColor: Colors.white,
                      borderWidth: 2,
                    ),
                  ),
                )
            ),
            Positioned(
                left: -200,
                top: 50,
                child: SizedBox(
                  width: 500,
                  height: 300,
                  child: AnimatedBuilder(
                    animation: _starController,
                    builder: (context, child) {
                      final angle = _starController.value * 2 * pi;
                      final x = 250 + 160 * cos(angle);
                      final y = 150 + 90 * sin(angle);
                      return Stack(
                        children: [
                          Positioned(
                            left: x - 10,
                            top: y - 10,
                            child: child!,
                          ),
                        ],
                      );
                    },
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                )
            ),
            Positioned(
                left: -100,
                top: 130,
                child: Transform.rotate(
                  angle: -0.03,
                  child: CustomPaint(
                    size: const Size(250, 140),
                    painter: OvalBorderPainter(
                      borderColor: Colors.white,
                      borderWidth: 2,
                    ),
                  ),
                )
            ),
            Positioned(
                left: -210,
                top: 50,
                child: SizedBox(
                  width: 500,
                  height: 300,
                  child: AnimatedBuilder(
                    animation: _starController,
                    builder: (context, child) {
                      final angle = _starController.value * 2 * pi;
                      final x = 250 + 90 * cos(angle);
                      final y = 150 + 60 * sin(angle);
                      return Stack(
                        children: [
                          Positioned(
                            left: x -10,
                            top: y - 10,
                            child: child!,
                          ),
                        ],
                      );
                    },
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                )
            ),
            Positioned(
                left: -60,
                top: 155,
                child: Transform.rotate(
                  angle: -0.03,
                  child: CustomPaint(
                    size: const Size(150, 88),
                    painter: OvalBorderPainter(
                      borderColor: Colors.white,
                      borderWidth: 2,
                    ),
                  ),
                )
            ),
            Positioned(
                left: -240,
                top: 50,
                child: SizedBox(
                  width: 500,
                  height: 300,
                  child: AnimatedBuilder(
                    animation: _starController,
                    builder: (context, child) {
                      final angle = _starController.value * 2 * pi;
                      final x = 250 + 60 * cos(angle);
                      final y = 150 + 30 * sin(angle);
                      return Stack(
                        children: [
                          Positioned(
                            left: x - 10,
                            top: y - 10,
                            child: child!,
                          ),
                        ],
                      );
                    },
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                )
            ),


          ],
        )
      ),
    );
  }
}

class OvalBorderPainter extends CustomPainter {
  final Color borderColor;
  final double borderWidth;

  OvalBorderPainter({required this.borderColor, required this.borderWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    final Rect rect = Rect.fromLTWH(0, 10, size.width-20, size.height-20);
    canvas.drawOval(rect, paint);
  }

  @override
  bool shouldRepaint(OvalBorderPainter oldDelegate) {
    return oldDelegate.borderColor != borderColor ||
        oldDelegate.borderWidth != borderWidth;
  }
}

class PositionedTransitionExample extends StatefulWidget {
  @override
  _PositionedTransitionExampleState createState() =>
      _PositionedTransitionExampleState();
}

class _PositionedTransitionExampleState
    extends State<PositionedTransitionExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<RelativeRect> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = RelativeRectTween(
      begin: RelativeRect.fromLTRB(0, 0, 380, 70),
      end: RelativeRect.fromLTRB(20, 20, 0, 0),
    ).animate(_controller);

    // Start the animation
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PositionedTransition(
          rect: _animation,
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(50)
            ),
          ),
        ),
      ],
    );
  }
}
