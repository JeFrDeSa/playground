import 'package:animations/animations_home_page.dart';
import 'package:app_theme/theme_data.dart' as theme_data;
import 'package:flutter/material.dart';

void main() {
  runApp(const AnimationsContainer());
}

class AnimationsContainer extends StatelessWidget {
  const AnimationsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animations',
      theme: theme_data.lightTheme,
      darkTheme: theme_data.darkTheme,
      home: AnimationsHomePage(key: AnimationsHomePage.keys.pageKey),
    );
  }
}
