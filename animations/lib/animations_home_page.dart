import 'package:animations/flutter_animation_examples/animate0.dart';
import 'package:app/widgets/home_page.dart';
import 'package:flutter/material.dart';

class _AnimationsHomePageKeys {
  const _AnimationsHomePageKeys._();

  final pageKey = const ValueKey("animation-home-page");
}

class AnimationsHomePage extends StatelessWidget {
  const AnimationsHomePage({Key? key}) : super(key: key);

  static const keys = _AnimationsHomePageKeys._();

  final pages = const [
    FlutterAnimationExample0(),
    Placeholder(color: Colors.red),
    Placeholder(color: Colors.green),
    Placeholder(color: Colors.blue),
  ];

  @override
  Widget build(BuildContext context) {
    return HomePage(
      subPageTitle: "Animations",
      pages: pages,
    );
  }
}
