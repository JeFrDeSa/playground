import 'package:app_theme/app_theme_home_page.dart';
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
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blueGrey,
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      home: AppThemeHomePage(key: AppThemeHomePage.keys.pageKey),
    );
  }
}
