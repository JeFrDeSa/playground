import 'package:app/widgets/home_page.dart';
import 'package:app_theme/widget/theme_group.dart';
import 'package:flutter/material.dart';

class _AppThemeHomePageKeys {
  const _AppThemeHomePageKeys._();

  final pageKey = const ValueKey("app-theme-home-page");
}

class AppThemeHomePage extends StatelessWidget {
  static const keys = _AppThemeHomePageKeys._();

  AppThemeHomePage({super.key});

  final pages = [
    Center(
      child: ThemeGroup(
        title: "Buttons",
        children: [
          ElevatedButton(onPressed: () {}, child: const Text("elevated")),
          FilledButton(onPressed: () {}, child: const Text("filled")),
          FilledButton.tonal(onPressed: () {}, child: const Text("filled tonal")),
          OutlinedButton(onPressed: () {}, child: const Text("outlined")),
          TextButton(onPressed: () {}, child: const Text("text")),
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return HomePage(
      subPageTitle: "App Theme",
      pages: pages,
    );
  }
}
