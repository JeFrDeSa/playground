import 'package:app/widgets/page_indicator/page_flow_indicator.dart';

/// The navigator initialization and update functionality.
mixin PageNavigator {
  late final void Function(int) onCurrentPageChanged;
  int currentPage = 0;
  int totalNumberOfPages = 1;

  /// Ensures the required [currentPage] and [totalNumberOfPages] information is
  /// provided either directly or via the provided [PageFlowIndicator].
  void initPageNavigator({
    required int? initialPage,
    required int? numberOfPages,
    required PageFlowIndicator? pageFlowIndicator,
    required void Function(int) onCurrentPageChanged,
  }) {
    assert(
      initialPage != null || pageFlowIndicator != null,
      "Either the current page number or a page indicator is required!",
    );
    currentPage = initialPage ?? pageFlowIndicator!.currentPage;

    assert(
      numberOfPages != null || pageFlowIndicator != null,
      "Either the total number of pages or a page indicator is required!",
    );
    totalNumberOfPages = numberOfPages ?? pageFlowIndicator!.totalNumberOfPages;

    this.onCurrentPageChanged = onCurrentPageChanged;
  }

  /// Updates the [currentPage] number by the given [stepSize] as long as the
  /// resulting index will be within the given limitation [limitedAt]. Jumps
  /// immediately to the first or last page index if a step exceeds the
  /// limitation and the current page number was not already the first or last.
  void updateCurrentPage({
    required int stepSize,
    required int limitedAt,
  }) {
    final nextPage = currentPage + stepSize;
    final isFirstOrLastPage = currentPage == limitedAt;

    if (nextPage < currentPage) {
      if (isFirstOrLastPage && nextPage < limitedAt) {
        return;
      }
      if (!isFirstOrLastPage && nextPage < limitedAt) {
        currentPage = limitedAt;
      } else {
        currentPage = nextPage;
      }
    } else {
      if (isFirstOrLastPage && nextPage > limitedAt) {
        return;
      }
      if (!isFirstOrLastPage && nextPage > limitedAt) {
        currentPage = limitedAt;
      } else {
        currentPage = nextPage;
      }
    }
    onCurrentPageChanged(currentPage);
  }
}
