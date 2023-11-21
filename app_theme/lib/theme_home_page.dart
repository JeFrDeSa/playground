import 'package:flutter/material.dart';

class _ThemeHomePageKeys {
  const _ThemeHomePageKeys._();

  final pageKey = const ValueKey("theme-home-page");
}

class ThemeHomePage extends StatefulWidget {
  static const keys = _ThemeHomePageKeys._();

  const ThemeHomePage({super.key});

  @override
  State<ThemeHomePage> createState() => _ThemeHomePageState();
}

class _ThemeHomePageState extends State<ThemeHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
