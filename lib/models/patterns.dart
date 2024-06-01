
class Pattern {
  final DateTime date;
  final String pattern;

  Pattern({
    required this.date,
    required this.pattern,
  });

  factory Pattern.fromJson(Map<String, dynamic> json) {
    return Pattern(
      date: json['date'] ?? 0,
      pattern: json['pattern'] ?? '',
    );
  }
}
