import 'package:flutter/material.dart';

/// Default [Text] widget used for titles that might
/// need to be shrink according to the available space.
class FittedTextBox extends StatelessWidget {
  final Text child;

  /// Creates a [Text] widget that is wrapped by a [FittedBox] to
  /// ensure the text width will not exceed the available space.
  const FittedTextBox({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: child,
      ),
    );
  }
}
