import 'package:app/widgets/home_page.dart';
import 'package:flutter/material.dart';
import 'package:widgets/sizing/fitted_box.dart';

class _WidgetsHomePageKeys {
  const _WidgetsHomePageKeys._();

  final pageKey = const ValueKey("widgets-home-page");
}

class WidgetsHomePage extends StatelessWidget {
  const WidgetsHomePage({super.key});

  static const keys = _WidgetsHomePageKeys._();

  final pages = const [
    LooseAndTightConstraintWidget(),
    Placeholder(color: Colors.red),
    Placeholder(color: Colors.green),
    Placeholder(color: Colors.blue),
  ];

  @override
  Widget build(BuildContext context) {
    return HomePage(
      subPageTitle: 'Widgets',
      pages: pages,
    );
  }
}
