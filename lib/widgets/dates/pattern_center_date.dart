import 'package:flutter/material.dart';

import 'package:patterns/widgets/pattern_card.dart';
import 'package:patterns/services/utils.dart';
import 'package:patterns/models/patterns.dart';

class PatternCenterDate extends StatelessWidget {
  const PatternCenterDate({
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(height: 20,),
          Text(dateFormatter(target, option: 1),
            style: TextStyle(
              // backgroundColor: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: 40,
              color: targetColor,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(1.0, 0.0),
                  blurRadius: 0.0,
                  color: targetColor,
                ),
                Shadow(
                  offset: Offset(0.0, 1.0),
                  blurRadius: 0.0,
                  color: targetColor,
                ),
                Shadow(
                  offset: Offset(-1.0, 0.0),
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
          Text(getWeekday(target).substring(0, 1).toUpperCase() + getWeekday(target).substring(1,),
            style: TextStyle(
              // backgroundColor: Colors.white,
              fontSize: 24,
              color: targetColor,
            ),)
        ],
      ),
    );
  }
}