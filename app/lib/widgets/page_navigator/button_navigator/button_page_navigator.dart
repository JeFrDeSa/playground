import 'package:app/widgets/page_indicator/page_flow_indicator.dart';
import 'package:app/widgets/page_navigator/page_navigator.dart';
import 'package:flutter/material.dart';

/// An [ElevatedButton] page navigator.
class ButtonPageNavigator extends StatefulWidget {
  final void Function(int) onCurrentPageChanged;
  final Axis direction;
  final PageFlowIndicator? pageFlowIndicator;
  final int? initialPage;
  final int? numberOfPages;

  /// Creates a navigator widget with a [direction] related layout. Calls its
  /// [onCurrentPageChanged] with the current page index. By providing
  /// a [pageFlowIndicator] the widget will illustrate the page flow.
  /// The information of the [currentPage] and [totalNumberOfPages] must
  /// be provided either directly or via a [PageFlowIndicator].
  const ButtonPageNavigator({
    required this.onCurrentPageChanged,
    this.direction = Axis.horizontal,
    this.pageFlowIndicator,
    this.initialPage,
    this.numberOfPages,
    Key? key,
  }) : super(key: key);

  @override
  State<ButtonPageNavigator> createState() => ButtonPageNavigatorState();
}

class ButtonPageNavigatorState extends State<ButtonPageNavigator>
    with PageNavigator {
  late final bool _isEnabled;

  @override
  void initState() {
    super.initState();
    initPageNavigator(
      initialPage: widget.initialPage,
      numberOfPages: widget.numberOfPages,
      pageFlowIndicator: widget.pageFlowIndicator,
      onCurrentPageChanged: widget.onCurrentPageChanged,
    );
    _isEnabled = _isNavigatorEnabled();
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: widget.direction,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: _stateRelatedOnPressed(
            onPressed: () {
              updateCurrentPage(
                // This navigates immediately to page 1
                stepSize: -totalNumberOfPages - 1,
                limitedAt: 0,
              );
            },
          ),
          child: const Icon(Icons.first_page),
        ),
        const SizedBox(width: 8),
        ElevatedButton(
          onPressed: _stateRelatedOnPressed(
            onPressed: () {
              updateCurrentPage(
                stepSize: -1,
                limitedAt: 0,
              );
            },
          ),
          child: const Icon(Icons.arrow_back),
        ),
        const SizedBox(width: 24),
        if (_isEnabled) widget.pageFlowIndicator ?? const SizedBox(),
        const SizedBox(width: 24),
        ElevatedButton(
          onPressed: _stateRelatedOnPressed(
            onPressed: () {
              updateCurrentPage(
                stepSize: 1,
                limitedAt: totalNumberOfPages - 1,
              );
            },
          ),
          child: const Icon(Icons.arrow_forward),
        ),
        const SizedBox(width: 8),
        ElevatedButton(
          onPressed: _stateRelatedOnPressed(
            onPressed: () {
              updateCurrentPage(
                // This navigates immediately to the last page
                stepSize: totalNumberOfPages + 1,
                limitedAt: totalNumberOfPages - 1,
              );
            },
          ),
          child: const Icon(Icons.last_page),
        ),
      ],
    );
  }

  bool _isNavigatorEnabled() {
    return widget.pageFlowIndicator != null && totalNumberOfPages > 1;
  }

  void Function()? _stateRelatedOnPressed({required Function() onPressed}) {
    return _isEnabled ? onPressed : null;
  }
}
