import 'package:flutter/material.dart';
import 'package:patterns/widgets/dates/bottom_left_date.dart';

import 'package:patterns/widgets/patterns/check_pattern_8_by_10.dart';
import 'package:patterns/widgets/patterns/irregular_diagonal_line.dart';
import 'package:patterns/widgets/patterns/rough_line.dart';
import 'package:patterns/widgets/patterns/two_type_check_pattern.dart';
import 'package:patterns/widgets/patterns/circle_mask_pattern.dart';
import 'package:patterns/widgets/patterns/opacity_grid_pattern.dart';
import 'package:patterns/widgets/patterns/heart_mask_check_pattern.dart';
import 'package:patterns/widgets/patterns/plaid_pattern.dart';
import 'package:patterns/widgets/patterns/rough_circle.dart';

import 'package:patterns/widgets/dates/center_date.dart';
import 'package:patterns/widgets/dates/center_month.dart';
import 'package:patterns/widgets/dates/right_bottom_day.dart';
import 'package:patterns/widgets/dates/header_date.dart';
import 'package:patterns/widgets/dates/bottom_right_day.dart';
import 'package:patterns/widgets/dates/pattern_center_date.dart';
import 'package:patterns/widgets/dates/center_filled_date.dart';

Map<String, Function()> patternMap = {
  'RoughCircle': () => RoughCircle(),
  'RoughLine': () => RoughLine(),
  'PlaidPattern': () => PlaidPattern(),
  'HeartMaskCheckPattern': () => HeartMaskCheckPattern(),
  'OpacityGridPattern': () => OpacityGridPattern(),
  'CircleMaskPattern': () => CircleMaskPattern(),
  'IrregularDiagonalLine': () => IrregularDiagonalLine(),
  'TwoTypeCheckPattern': () => TwoTypeCheckPattern(),
  'CheckPattern8By10': () => CheckPattern8By10(),
};

Widget getDateWidget(String className, DateTime targetTime) {
  switch (className) {
    case 'CenterDate':
      return CenterDate(target: targetTime);
    case 'CenterFilledDate':
      return CenterFilledDate(target: targetTime, targetColor: Colors.deepOrange);
    case 'CenterMonth':
      return CenterMonth(target: targetTime, targetColor: Colors.pink.shade600);
    case 'PatternCenterDate':
      return PatternCenterDate(target: targetTime, targetColor: Colors.deepOrange.shade600);
    case 'RightBottomDay':
      return RightBottomDay(target: targetTime);
    case 'HeaderDate':
      return HeaderDate(target: targetTime, targetColor: Colors.orangeAccent);
    case 'PurpleHeaderDate':
      return HeaderDate(target: targetTime, targetColor: Colors.deepPurpleAccent);
    case 'BottomRightDay':
      return BottomRightDay(target: targetTime);
    case 'BottomLeftDate':
      return BottomLeftDate(target: targetTime);
    default:
      throw Exception('Unsupported class name: $className');
  }
}