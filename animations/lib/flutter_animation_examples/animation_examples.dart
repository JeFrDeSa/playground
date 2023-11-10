import 'package:animations/flutter_animation_examples/animate1.dart';
import 'package:animations/flutter_animation_examples/animate2.dart';
import 'package:animations/flutter_animation_examples/animate3.dart';
import 'package:animations/flutter_animation_examples/animate4.dart';
import 'package:animations/flutter_animation_examples/animate5.dart';
import 'package:flutter/material.dart';

/// Groups the Flutter animation examples 1-5 and illustrates them in one widget.
class FlutterAnimationExamples extends StatelessWidget {
  /// Creates a column of all FlutterAnimationExamples in reversed order.
  const FlutterAnimationExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          FlutterAnimationExample5(),
          Row(
            children: [
              Expanded(child: FlutterAnimationExample3()),
              SizedBox(width: 12.0),
              Expanded(child: FlutterAnimationExample4()),
            ],
          ),
          Row(
            children: [
              Expanded(child: FlutterAnimationExample1()),
              SizedBox(width: 12.0),
              Expanded(child: FlutterAnimationExample2()),
            ],
          ),
        ],
      ),
    );
  }
}
