import 'package:flutter/material.dart';
import 'package:app_theme/theme_data.dart' as theme_data;

void main() {
  runApp(const AppThemeContainer());
}

class AppThemeContainer extends StatelessWidget {
  const AppThemeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App Theme',
      theme: theme_data.lightTheme,
      darkTheme: theme_data.darkTheme,
      debugShowCheckedModeBanner: false,
      // TODO(Implement): Different widgets and textStyle to illustrate the Theme.
      home: const Placeholder(),
    );
  }
}
