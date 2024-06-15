
class Pattern {
  final DateTime date;
  final String pattern;
  final String dateWidget;

  Pattern({
    required this.date,
    required this.pattern,
    required this.dateWidget,
  });

  factory Pattern.fromJson(Map<String, dynamic> json) {
    return Pattern(
      date: json['date'] ?? 0,
      pattern: json['pattern'] ?? '',
      dateWidget: json['dateWidget'] ?? '',
    );
  }
}
