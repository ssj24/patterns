import 'dart:math';

import 'package:flutter/material.dart';

class SolarSystem extends StatefulWidget {
  const SolarSystem({super.key});

  @override
  State<SolarSystem> createState() => _SolarSystemState();
}

class _SolarSystemState extends State<SolarSystem>  with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Positioned> generatePositionedWidgets(int count) {
    return List<Positioned>.generate(count, (index) {
      double top = Random().nextDouble() * 400; // Random top position between 0 and 200
      double left = Random().nextDouble() * 400;
      double width = Random().nextDouble() * 10;
      double height = Random().nextDouble() * 20;
      return Positioned(
        top: top,
        left: left,
        child: Container(
          width: width,
          height: width,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(50)
          ),
        ),
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
                  child: SizedBox(
                    width: 500,
                    height: 300,
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        final angle = _controller.value * 2 * pi;
                        final x = 250 + 250 * cos(angle);
                        final y = 150 + 150 * sin(angle);
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
                  ),
                ),
              )
            ),
            Positioned(
              left: 200,
              top: 70,
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
            ...generatePositionedWidgets(30)

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

    final Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
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
