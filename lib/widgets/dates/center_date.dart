import 'package:flutter/material.dart';

import 'package:patterns/widgets/pattern_card.dart';
import 'package:patterns/services/utils.dart';
import 'package:patterns/models/patterns.dart';

class CenterDate extends StatelessWidget {
  const CenterDate({
    super.key,
    required this.target,
  });

  final DateTime target;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(dateFormatter(target, option: 1),
            style: TextStyle(
              // backgroundColor: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: 24,
              color: Colors.white,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(2.0, 2.0),
                  blurRadius: 3.0,
                  color: Color.fromARGB(255, 249, 81, 80),
                ),
              ],
            ),
          ),
          Text(getWeekday(target).toUpperCase(),
            style: TextStyle(
              // backgroundColor: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: 24,
              color: Colors.white,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(2.0, 2.0),
                  blurRadius: 3.0,
                  color: Color.fromARGB(255, 249, 81, 80),
                ),
              ],
            ),)
        ],
      ),
    );
  }
}