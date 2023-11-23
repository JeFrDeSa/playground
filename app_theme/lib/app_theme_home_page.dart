import 'package:app/widgets/home_page.dart';
import 'package:app_theme/widget/button_theme_group.dart';
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
      child: ButtonThemeGroup(
        title: "Buttons",
        buttons: [
          SizedBox(
            width: 120,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("elevated"),
            ),
          ),
          SizedBox(
            width: 120,
            child: FilledButton(
              onPressed: () {},
              child: const Text("filled"),
            ),
          ),
          SizedBox(
            width: 120,
            child: FilledButton.tonal(
              onPressed: () {},
              child: const Text("filled tonal"),
            ),
          ),
          SizedBox(
            width: 120,
            child: OutlinedButton(
              onPressed: () {},
              child: const Text("outlined"),
            ),
          ),
          SizedBox(
            width: 120,
            child: TextButton(
              onPressed: () {},
              child: const Text("text"),
            ),
          ),
        ],
        iconButtons: [
          SizedBox(
            width: 120,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.sunny),
              label: const Text("Icon"),
            ),
          ),
          SizedBox(
            width: 120,
            child: FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.sunny),
              label: const Text("Icon"),
            ),
          ),
          SizedBox(
            width: 120,
            child: FilledButton.tonalIcon(
              onPressed: () {},
              icon: const Icon(Icons.sunny),
              label: const Text("Icon"),
            ),
          ),
          SizedBox(
            width: 120,
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.sunny),
              label: const Text("Icon"),
            ),
          ),
          SizedBox(
            width: 120,
            child: TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.sunny),
              label: const Text("Icon"),
            ),
          ),
        ],
        disabledButtons: const [
          SizedBox(
            width: 120,
            child: ElevatedButton(
              onPressed: null,
              child: Text("elevated"),
            ),
          ),
          SizedBox(
            width: 120,
            child: FilledButton(
              onPressed: null,
              child: Text("filled"),
            ),
          ),
          SizedBox(
            width: 120,
            child: FilledButton.tonal(
              onPressed: null,
              child: Text("filled tonal"),
            ),
          ),
          SizedBox(
            width: 120,
            child: OutlinedButton(
              onPressed: null,
              child: Text("outlined"),
            ),
          ),
          SizedBox(
            width: 120,
            child: TextButton(
              onPressed: null,
              child: Text("text"),
            ),
          ),
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
