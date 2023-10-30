import 'package:app/widgets/page_indicator/dotted_line_indicator/dotted_line_indicator_properties.dart';
import 'package:app/widgets/page_indicator/dotted_line_indicator/dotted_line_indicator_widget.dart';
import 'package:app/widgets/page_indicator/page_flow_indicator.dart';
import 'package:flutter/material.dart';

class DottedLinePageIndicator extends PageFlowIndicator {
  const DottedLinePageIndicator({
    required super.currentPage,
    required super.totalNumberOfPages,
    super.key,
  });

  @override
  List<Widget> determinePageFlowIndicators({
    required BuildContext context,
    required int currentPage,
    required int totalNumberOfPages,
  }) {
    List<DottedLineIndicatorProperties> indicatorProperties =
        List.generate(totalNumberOfPages, (index) {
      if (index < currentPage) {
        return DottedLineIndicatorProperties(
          color: Theme.of(context).disabledColor,
        );
      }
      if (index == currentPage) {
        return DottedLineIndicatorProperties(
          width: 24,
          color: Theme.of(context).colorScheme.onPrimary,
        );
      }
      return DottedLineIndicatorProperties(
        color: Theme.of(context).iconTheme.color!,
      );
    });

    return List.generate(indicatorProperties.length, (index) {
      return DottedLineIndicatorWidget(
        indicatorProperties: indicatorProperties.elementAt(index),
      );
    });
  }
}
