import 'package:flutter/material.dart';

import 'package:patterns/services/utils.dart';

class RightBottomDay extends StatelessWidget {
  const RightBottomDay({
    super.key,
    required this.target,
  });

  final DateTime target;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200,
        height: 200,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Text(dateFormatter(target, option: 1),
                style: const TextStyle(
                  // backgroundColor: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 40,
                  color: Colors.pinkAccent,
                  height: 1,
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: RotatedBox(
                  quarterTurns: 3,
                  child: Text(getWeekday(target).substring(0, 1).toUpperCase() + getWeekday(target).substring(1),
                    style: const TextStyle(
                      // backgroundColor: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w900,
                      fontSize: 40,
                      color: Colors.pinkAccent,
                      height: 1,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(1.2, 1.2),
                          blurRadius: 1.2,
                          color: Colors.pinkAccent
                        ),
                      ],
                    ),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}