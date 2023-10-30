import 'package:app/widgets/page_indicator/dotted_line_indicator/dotted_line_indicator_properties.dart';
import 'package:flutter/material.dart';

class DottedLineIndicatorWidget extends StatelessWidget {
  final DottedLineIndicatorProperties indicatorProperties;

  const DottedLineIndicatorWidget({
    Key? key,
    required this.indicatorProperties,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(horizontal: 4),
        height: indicatorProperties.height,
        width: indicatorProperties.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: indicatorProperties.color,
        ),
      ),
    );
  }
}
