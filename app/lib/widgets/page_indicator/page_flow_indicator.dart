import 'package:flutter/material.dart';

/// Base widget for all page flow indicators.
abstract class PageFlowIndicator extends StatelessWidget {
  final int currentPage;
  final int totalNumberOfPages;
  final Axis direction;

  const PageFlowIndicator({
    Key? key,
    required this.currentPage,
    required this.totalNumberOfPages,
    this.direction = Axis.horizontal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: direction,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: determinePageFlowIndicators(
        context: context,
        currentPage: currentPage,
        totalNumberOfPages: totalNumberOfPages,
      ),
    );
  }

  /// Determines the indicator widget related properties based on the given
  /// [currentPage] index and the information about the [totalNumberOfPages].
  /// Provides a list of the indicator related widgets with the previously
  /// determined properties.
  List<Widget> determinePageFlowIndicators({
    required BuildContext context,
    required int currentPage,
    required int totalNumberOfPages,
  });
}

