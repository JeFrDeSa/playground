import 'package:app_theme/theme_home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AppThemeContainer());
}

class AppThemeContainer extends StatelessWidget {
  const AppThemeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App Theme',
      themeMode: ThemeMode.system,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
        colorScheme: const ColorScheme.light(),
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blueGrey,
        colorScheme: const ColorScheme.dark(),
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      home: ThemeHomePage(key: ThemeHomePage.keys.pageKey),
    );
  }
}
