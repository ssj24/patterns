import 'package:flutter/material.dart';

import 'package:patterns/widgets/pattern_card.dart';
import 'package:patterns/services/utils.dart';
import 'package:patterns/models/patterns.dart';

class HeaderDate extends StatelessWidget {
  const HeaderDate({
    super.key,
    required this.target,
    required this.targetColor,
  });

  final DateTime target;
  final MaterialAccentColor targetColor;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
        top: 0,
        right: 80,
        child: Stack(
          children: [
            Container(
              width: 20,
              height: 15,
              // color: Colors.red,
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(width: 2.0, color: targetColor.shade200))
                ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Container(
                width: 10,
                height: 20,
                // color: Colors.red,
                decoration: BoxDecoration(
                    border: Border(right: BorderSide(width: 2.0, color: targetColor.shade200))
                ),
              ),
            ),
          ],
        ),
      ),
      Positioned(
        top: 0,
        right: 45,
        child: Stack(
          children: [
            Container(
              width: 10,
              height: 10,
              // color: Colors.red,
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: targetColor.shade200))
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Container(
                width: 5,
                height: 10,
                // color: Colors.red,
                decoration: BoxDecoration(
                    border: Border(right: BorderSide(color: targetColor.shade100))
                ),
              ),
            ),
          ],
        ),
      ),
      Positioned(
        top: 0,
        right: 20,
        child: Stack(
          children: [
            Container(
              width: 16,
              height: 20,
              // color: Colors.red,
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(width: 2, color: targetColor.shade200))
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                width: 8,
                height: 16,
                // color: Colors.red,
                decoration: BoxDecoration(
                    border: Border(right: BorderSide(width: 2, color: targetColor.shade200))
                ),
              ),
            ),
          ],
        ),
      ),
      Positioned(
        top: 5,
        left: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text(
                dateFormatter(target, option: 1),
                style: TextStyle(
                  // backgroundColor: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 36,
                  color: targetColor.shade200,
                ),
              ),
            ),
            Text(
              getWeekday(target).substring(0, 1).toUpperCase(),
              style: TextStyle(
                // backgroundColor: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 20,
                color: targetColor.shade200,
              ),
            ),
            Text(
              getWeekday(target).substring(1),
              style: TextStyle(
                // backgroundColor: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 20,
                color: targetColor.shade200,
              ),
            )
          ],
        ),
      ),
    ]);
  }
}
