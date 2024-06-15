import 'package:flutter/material.dart';

import 'package:patterns/widgets/patterns/irregular_diagonal_line.dart';
import 'package:patterns/widgets/patterns/two_type_check_pattern.dart';

import 'package:patterns/widgets/dates/center_date.dart';
import 'package:patterns/widgets/dates/right_bottom_day.dart';

Map<String, Function()> patternMap = {
  'IrregularDiagonalLine': () => IrregularDiagonalLine(),
  'TwoTypeCheckPattern': () => TwoTypeCheckPattern(),
};

Widget getDateWidget(String className, DateTime targetTime) {
  switch (className) {
    case 'CenterDate':
      return CenterDate(target: targetTime);
    case 'RightBottomDay':
      return RightBottomDay(target: targetTime);
    default:
      throw Exception('Unsupported class name: $className');
  }
}