import 'package:flutter/material.dart';

import 'package:patterns/widgets/pattern_card.dart';
import 'package:patterns/services/utils.dart';
import 'package:patterns/models/patterns.dart';

class CenterMonth extends StatelessWidget {
  const CenterMonth({
    super.key,
    required this.target,
    required this.targetColor,
  });

  final DateTime target;
  final Color targetColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(getMonth(target),
            style: TextStyle(
              // backgroundColor: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: 56,
              height: 1,
              color: targetColor,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(2.0, 0.0),
                  blurRadius: 0.0,
                  color: targetColor,
                ),
                Shadow(
                  offset: Offset(0.0, 1.0),
                  blurRadius: 0.0,
                  color: targetColor,
                ),
                Shadow(
                  offset: Offset(-2.0, 0.0),
                  blurRadius: 0.0,
                  color: targetColor,
                ),
                Shadow(
                  offset: Offset(0.0, -1.0),
                  blurRadius: 0.0,
                  color: targetColor,
                ),
              ],
            ),
          ),
          Text(getMonthName(target),
            style: TextStyle(
              // backgroundColor: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: 40,
              letterSpacing: 4,
              height: 1,
              color: targetColor,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(1.0, 0.0),
                  blurRadius: 1.0,
                  color: targetColor,
                ),
              ],
            ),)
        ],
      ),
    );
  }
}