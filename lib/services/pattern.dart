import 'package:flutter/material.dart';
import 'package:patterns/widgets/patterns/check_pattern_8_by_10.dart';

import 'package:patterns/widgets/patterns/irregular_diagonal_line.dart';
import 'package:patterns/widgets/patterns/two_type_check_pattern.dart';
import 'package:patterns/widgets/patterns/check_pattern_8_by_10.dart';

import 'package:patterns/widgets/dates/center_date.dart';
import 'package:patterns/widgets/dates/right_bottom_day.dart';
import 'package:patterns/widgets/dates/header_date.dart';

Map<String, Function()> patternMap = {
  'IrregularDiagonalLine': () => IrregularDiagonalLine(),
  'TwoTypeCheckPattern': () => TwoTypeCheckPattern(),
  'CheckPattern8By10': () => CheckPattern8By10(),
};

Widget getDateWidget(String className, DateTime targetTime) {
  switch (className) {
    case 'CenterDate':
      return CenterDate(target: targetTime);
    case 'RightBottomDay':
      return RightBottomDay(target: targetTime);
    case 'HeaderDate':
      return HeaderDate(target: targetTime);
    default:
      throw Exception('Unsupported class name: $className');
  }
}