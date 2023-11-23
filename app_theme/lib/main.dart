import 'package:app_theme/app_theme_home_page.dart';
import 'package:app_theme/theme_data.dart';
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
      theme: lightTheme,
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: AppThemeHomePage(key: AppThemeHomePage.keys.pageKey),
      ),
    );
  }
}
