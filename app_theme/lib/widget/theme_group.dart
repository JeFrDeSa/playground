import 'package:flutter/material.dart';

class ThemeGroup extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const ThemeGroup({
    required this.title,
    required this.children,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FocusTraversalGroup(
      child: Card(
        elevation: 0.0,
        color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.3),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title, style: Theme.of(context).textTheme.titleLarge),
              const Divider(thickness: 2.0, indent: 5.0, endIndent: 5.0),
              ...children,
            ],
          ),
        ),
      ),
    );
  }
}
