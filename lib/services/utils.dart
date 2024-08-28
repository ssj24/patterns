import 'dart:math';
import 'dart:ui';
import 'package:intl/intl.dart';

String dateFormatter(DateTime date, {int option = 0}) {
  int year = date.year;
  String month = date.month < 10 ? '0${date.month}' : date.month.toString();
  String day = date.day < 10 ? '0${date.day}' : date.day.toString();

  return option == 0 ? '$year/$month/$day' : day;
}

String getMonth(DateTime date) {
  return date.month.toString();
}

String getMonthName(DateTime date) {
  String month = DateFormat("MMMM").format(date);
  return month.substring(0, 1).toUpperCase() + month.substring(1,);
}

String getWeekday(DateTime date) {
  int weekday = date.weekday;
  List<String> weekdays = ['monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday', 'sunday'];
  return(weekdays[weekday - 1]);
}

Color getRandomColor() {
  Random random = Random();
  return Color.fromRGBO(
    random.nextInt(256), // Red
    random.nextInt(256), // Green
    random.nextInt(256), // Blue
    1.0, // Opacity
  );
}