import 'package:flutter/material.dart';

/// Creates a widget that visually groups the given [children] in a column below
/// the provided [title].
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
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title, style: Theme.of(context).textTheme.headlineSmall),
              Divider(
                thickness: 2.0,
                indent: 5.0,
                endIndent: 5.0,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
              ...children,
            ],
          ),
        ),
      ),
    );
  }
}
