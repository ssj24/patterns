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
  Pattern target = Pattern(
    date: DateTime.parse('2024-06-01'),
    pattern: "IrregularDiagonalLinePainter",
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(widget.title),),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Wrap(
            children: [
              Center(
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
                            dateFormatter(target.date),
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      PatternCard(target: target),
                    ],
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
