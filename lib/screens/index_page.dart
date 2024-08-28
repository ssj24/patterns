import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:patterns/widgets/pattern_card.dart';
import 'package:patterns/models/patterns.dart';
import 'package:patterns/services/utils.dart';

class IndexPage extends StatefulWidget {
  final String title;
  const IndexPage({super.key, required this.title});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  List<Pattern> patterns = [
    Pattern(
      date: DateTime.parse('2024-08-22'),
      pattern: "CircleMaskPattern",
      dateWidget: "BottomRightDay",
    ),
    Pattern(
      date: DateTime.parse('2024-08-21'),
      pattern: "CheckPattern8By10",
      dateWidget: "HeaderDate",
    ),
    Pattern(
      date: DateTime.parse('2024-06-15'),
      pattern: "TwoTypeCheckPattern",
      dateWidget: "RightBottomDay",
    ),
    Pattern(
      date: DateTime.parse('2024-06-01'),
      pattern: "IrregularDiagonalLine",
      dateWidget: "CenterDate",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(widget.title),),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                for ( var target in patterns )
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PatternCard(target: target),
                  )
              ],
            )
          ),
        ),
      ),
    );
  }
}
