import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:patterns/widgets/pattern_card.dart';
import 'package:patterns/services/utils.dart';

class BottomRightDay extends StatelessWidget {
  const BottomRightDay({
    super.key,
    required this.target,
  });

  final DateTime target;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        width: 200,
        height: 150,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
                children: [
                  Positioned(
                    right: 0,
                    child: Text(dateFormatter(target, option: 1),
                      style: TextStyle(
                        // backgroundColor: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 40,
                        color: Colors.purple.shade300,
                        height: 1,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 40,
                    child: Text(getWeekday(target).substring(0, 1).toUpperCase() + getWeekday(target).substring(1),
                      style: TextStyle(
                        // backgroundColor: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w900,
                        fontSize: 40,
                        color: Colors.purple.shade300,
                        height: 1,
                      ),),
                  )
                ],
              ),
            ),
        ),
        ),
    );
  }
}