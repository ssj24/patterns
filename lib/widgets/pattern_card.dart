import 'package:flutter/material.dart';
import 'package:patterns/models/patterns.dart';
import 'package:patterns/services/pattern.dart';
import 'dates/center_date.dart';


class PatternCard extends StatefulWidget {
  final Pattern target;
  const PatternCard({super.key, required this.target});

  @override
  State<PatternCard> createState() => _PatternCardState();
}

class _PatternCardState extends State<PatternCard> {

  @override
  Widget build(BuildContext context) {
    dynamic customPatternPainter = classMap[widget.target.pattern]!();
    // CustomPainter? customPatternPainter = classMap[widget.target.pattern]!();
    return Expanded(
      child: Container(
        child: Stack(
          children: [
            Center(
              child: customPatternPainter,
            ),
            CenterDate(widget: widget),
          ]
        ),
      ),
    );
  }
}