import 'package:flutter/material.dart';

import 'package:patterns/services/utils.dart';

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
            style: const TextStyle(
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
            style: const TextStyle(
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