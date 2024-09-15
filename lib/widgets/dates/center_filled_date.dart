import 'package:flutter/material.dart';

import 'package:patterns/widgets/pattern_card.dart';
import 'package:patterns/services/utils.dart';
import 'package:patterns/models/patterns.dart';

class CenterFilledDate extends StatelessWidget {
  const CenterFilledDate({
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
          Text(dateFormatter(target, option: 1),
            style: TextStyle(
              // backgroundColor: Colors.white,
              height: 1,
              fontWeight: FontWeight.w900,
              fontSize: 40,
              color: targetColor,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(1.0, 1.0),
                  blurRadius: 1.0,
                  color: targetColor,
                ),
              ],
            ),
          ),
          Text(getWeekday(target).substring(0,1).toUpperCase() + getWeekday(target).substring(1,),
            style: TextStyle(
              // backgroundColor: Colors.white,
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.italic,
              letterSpacing: 1.5,
              fontSize: 35,
              color: targetColor,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(1.0, 1.0),
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