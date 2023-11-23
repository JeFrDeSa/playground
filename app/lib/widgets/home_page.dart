import 'package:app/widgets/home_page_app_bar.dart';
import 'package:app/widgets/home_page_bottom_bar.dart';
import 'package:app/widgets/page_indicator/dotted_line_indicator/dotted_line_page_indicator.dart';
import 'package:app/widgets/page_navigator/button_navigator/button_page_navigator.dart';
import 'package:flutter/material.dart';

/// Default page layout used for all app pages.
class HomePage extends StatefulWidget {
  final String subPageTitle;
  final List<Widget> pages;
  final int initialPage;
  final Widget? pageNavigator;

  /// Creates a [Scaffold] that provides a [HomePageAppBar] that is determined
  /// based on the given [subPageTitle] and [pages] information.
  const HomePage({
    required this.subPageTitle,
    required this.pages,
    this.pageNavigator,
    this.initialPage = 0,
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int _currentPage;

  @override
  void initState() {
    _currentPage = widget.initialPage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: HomePageAppBar(
          pageTitle: widget.subPageTitle,
          pageNumber: widget.pages.length > 1 ? _currentPage + 1 : null,
        ),
        body: widget.pages[_currentPage],
        // TODO(Refactor): The HomePage should not define the navigator for all pages.
        // The kind of the navigator (e.g. ButtonPageNavigator) as well as the
        // optional page flow indicator (e.g. DottedLinePageIndicator) should
        // be defined from outside.
        //
        // (!) Caution: Without any state management it might be tricky to
        // define the widgets outside of HomePage, while setState(() {}) of
        // onCurrentPageChanged needs to be defined within the HomePage.
        bottomNavigationBar: HomePageBottomBar(
          pageNavigator: ButtonPageNavigator(
            pageFlowIndicator: DottedLinePageIndicator(
              currentPage: _currentPage,
              totalNumberOfPages: widget.pages.length,
            ),
            onCurrentPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
