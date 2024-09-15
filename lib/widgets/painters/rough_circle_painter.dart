import 'dart:math';

import 'package:flutter/material.dart';

import 'package:patterns/services/utils.dart';

class RoughCirclePainter extends CustomPainter {
  final Random random = Random();
  final int rows;
  final int cols;
  RoughCirclePainter({required this.rows, required this.cols});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.deepOrange.withOpacity(0.7)
      ..style = PaintingStyle.fill;
      // ..style = PaintingStyle.stroke
      // ..strokeWidth = 2.0;

    // Define the radius and center of the circle
    double circleWidth = size.width / cols;
    double circleHeight = size.height / rows;
    double radius = max(circleWidth, circleHeight) / 7;
    // Offset center = Offset(size.width / 2, size.height / 2);

    for (int row = 0; row < rows; row++) {
      for (int col = 0; col < cols; col++) {
        // Calculate the center for each circle in the grid
        Offset center = Offset(
          col * circleWidth + (radius*3),
          row * circleHeight + (radius*3),
        );

        // Create a path for the rough circle
        Path path = Path();

        //Move to the start point at the top of the circle
        path.moveTo(
          center.dx + radius,
          center.dy,
        );

        //Create a smooth circle with slight variations
        for (int i = 0; i <= 360; i += 60) {
          // Calculate the angle for this point
          double angle = i * pi / 180;

          // Add slight random variation to the radius
          double distortedRadius = radius + random.nextDouble() * 3 - 1.5; // Random value between -1.5 and 1.5

          // Calculate the x and y positions of the point
          double x = center.dx + distortedRadius * cos(angle);
          double y = center.dy + distortedRadius * sin(angle);

          // Draw line to the next point
          path.lineTo(x, y);
        }

        // List<Offset> points = [];
        //
        // // Define the number of points to use for the rough circle
        // int pointsCount = 7;
        //
        // for (int i = 0; i <= pointsCount; i++) {
        //   // Calculate the angle for this point
        //   double angle = (i / pointsCount) * 2 * pi;
        //
        //   // Calculate the x and y offsets with some random distortion
        //   double xOffset = random.nextDouble() * 5 - 2.5; // Random value between -2.5 and 2.5
        //   double yOffset = random.nextDouble() * 5 - 2.5; // Random value between -2.5 and 2.5
        //   double randomRadius = radius + random.nextDouble() * 5 - 2.5;
        //   // Calculate the x and y positions of the point
        //   // double x = center.dx + (radius + xOffset) * cos(angle);
        //   // double y = center.dy + (radius + yOffset) * sin(angle);
        //   double x = center.dx + randomRadius * cos(angle);
        //   double y = center.dy + randomRadius * sin(angle);
        //   // Add the point to the list
        //   points.add(Offset(x, y));
        // }
        //
        // // Move to the first point
        // path.moveTo(points[0].dx, points[0].dy);
        //
        // // Draw smooth curves between each point
        // for (int i = 1; i < points.length; i++) {
        //   // Use quadratic Bezier curves for smoother transitions
        //   Offset controlPoint = points[i];
        //   path.quadraticBezierTo(
        //     controlPoint.dx,
        //     controlPoint.dy,
        //     points[i].dx,
        //     points[i].dy,
        //   );
        // }
        //
        // // Connect the last point to the first
        // path.quadraticBezierTo(
        //   points[0].dx,
        //   points[0].dy,
        //   points[0].dx,
        //   points[0].dy,
        // );

        // Draw cubic bezier curves between each point
        // for (int i = 1; i < points.length; i++) {
        //   // Control points for smooth curves
        //   Offset controlPoint1 = Offset(
        //     (points[i - 1].dx + points[i].dx) / 2,
        //     points[i - 1].dy,
        //   );
        //   Offset controlPoint2 = Offset(
        //     (points[i - 1].dx + points[i].dx) / 2,
        //     points[i].dy,
        //   );
        //
        //   // Draw a cubic bezier curve to the current point
        //   path.cubicTo(
        //     controlPoint1.dx,
        //     controlPoint1.dy,
        //     controlPoint2.dx,
        //     controlPoint2.dy,
        //     points[i].dx,
        //     points[i].dy,
        //   );
        // }

        // // Draw curves between each point
        // for (int i = 1; i < points.length; i++) {
        //   // Find the midpoint between the current point and the next one
        //   int nextIndex = (i + 1) % points.length;
        //   Offset midpoint = Offset(
        //     (points[i].dx + points[nextIndex].dx) / 2,
        //     (points[i].dy + points[nextIndex].dy) / 2,
        //   );
        //
        //   // Draw a quadratic bezier curve to the midpoint
        //   path.quadraticBezierTo(points[i].dx, points[i].dy, midpoint.dx, midpoint.dy);
        // }

        // Close the path to complete the circle
        path.close();

        // Draw the rough circle path
        canvas.drawPath(path, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // 항상 다시 그리도록 설정
    return true;
  }
}
