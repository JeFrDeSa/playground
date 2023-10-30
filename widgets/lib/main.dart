import 'package:flutter/material.dart';
import 'package:app_theme/theme_data.dart' as theme_data;
import 'package:widgets/widgets_home_page.dart';

void main() {
  runApp(const WidgetsContainer());
}

class WidgetsContainer extends StatelessWidget {
  const WidgetsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Widgets',
      theme: theme_data.lightTheme,
      darkTheme: theme_data.darkTheme,
      debugShowCheckedModeBanner: false,
      home: WidgetsHomePage(key: WidgetsHomePage.keys.pageKey),
    );
  }
}
