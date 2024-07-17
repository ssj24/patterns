import 'package:flutter/material.dart';
import 'package:patterns/models/patterns.dart';
import 'package:patterns/services/pattern.dart';
import '../services/utils.dart';


class PatternCard extends StatefulWidget {
  final Pattern target;
  const PatternCard({super.key, required this.target});

  @override
  State<PatternCard> createState() => _PatternCardState();
}

class _PatternCardState extends State<PatternCard> {

  @override
  Widget build(BuildContext context) {
    dynamic customPatternPainter = patternMap[widget.target.pattern]!();
    var dateWidget = getDateWidget(widget.target.dateWidget, widget.target.date);
    // CustomPainter? customPatternPainter = classMap[widget.target.pattern]!();
    return Center(
        child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 3,
                )
            ),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  color: Colors.black,
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      dateFormatter(widget.target.date),
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Stack(
                      children: [
                        Center(
                          child: customPatternPainter,
                        ),
                        dateWidget,
                        // CenterDate(target: widget.target),
                      ]
                  ),
                ),

              ],
            )
        )
    );
  }
}