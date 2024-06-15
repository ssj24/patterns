import 'package:flutter/material.dart';

import 'package:patterns/widgets/pattern_card.dart';
import 'package:patterns/services/utils.dart';

class RightBottomDay extends StatelessWidget {
  const RightBottomDay({
    super.key,
    required this.target,
  });

  final DateTime target;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(dateFormatter(target, option: 1),
          style: TextStyle(
            // backgroundColor: Colors.white,
            fontWeight: FontWeight.w900,
            fontSize: 24,
            color: Colors.black,
          ),
        ),
        Text(getWeekday(target).toUpperCase(),
          style: TextStyle(
            // backgroundColor: Colors.white,
            fontWeight: FontWeight.w900,
            fontSize: 24,
            color: Colors.black,
          ),)
      ],
    );
  }
}