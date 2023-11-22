import 'package:app/widgets/home_page.dart';
import 'package:app_theme/widget/theme_group.dart';
import 'package:flutter/material.dart';

class _AppThemeHomePageKeys {
  const _AppThemeHomePageKeys._();

  final pageKey = const ValueKey("app-theme-home-page");
}

class AppThemeHomePage extends StatelessWidget {
  static const keys = _AppThemeHomePageKeys._();

  const AppThemeHomePage({super.key});

  final pages = const [
    Center(
      child: ThemeGroup(
        title: "Buttons",
        children: [
          SizedBox(height: 100, width: 100, child: Placeholder()),
          SizedBox(height: 100, width: 100, child: Placeholder()),
          SizedBox(height: 100, width: 100, child: Placeholder()),
        ],
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return HomePage(
      subPageTitle: "App Theme",
      pages: pages,
    );
  }
}
