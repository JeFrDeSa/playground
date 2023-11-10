import 'package:flutter/material.dart';

/// Default page [BottomAppBar] layout.
class HomePageBottomBar extends StatelessWidget {
  final Widget pageNavigator;

  /// Creates an [BottomAppBar] with a [PageNavigator].
  const HomePageBottomBar({
    required this.pageNavigator,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: pageNavigator,
        ),
      ),
    );
  }
}
