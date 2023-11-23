import 'package:flutter/material.dart';
import 'package:app_theme/ui_properties.dart' as ui_properties;

/// Visually groups the given widgets lists below a title.
class ButtonThemeGroup extends StatelessWidget {
  final String title;
  final List<Widget> buttons;
  final List<Widget> iconButtons;
  final List<Widget> disabledButtons;

  /// Creates a widget that visually groups the given widget lists below the
  /// provided [title]. The entries of the widget lists will be listed based
  /// on their index row by row.
  const ButtonThemeGroup({
    required this.title,
    required this.buttons,
    required this.iconButtons,
    required this.disabledButtons,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final requiredLength = buttons.length;
    assert(
      buttons.length == requiredLength &&
          iconButtons.length == requiredLength &&
          disabledButtons.length == requiredLength,
      "Expected an equal list length of the provided button widgets.",
    );

    return Card(
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
        borderRadius: const BorderRadius.all(ui_properties.widgetBoarderRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: Theme.of(context).textTheme.headlineSmall),
            Divider(
              thickness: 2.0,
              indent: 5.0,
              endIndent: 5.0,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(children: _alignButtons()),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _alignButtons() {
    final rowEntries = <Widget>[];

    for (int i = 0; i < buttons.length; i++) {
      rowEntries.add(
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buttons[i],
              const SizedBox(width: 10.0),
              iconButtons[i],
              const SizedBox(width: 10.0),
              disabledButtons[i],
            ],
          ),
        ),
      );
    }

    return rowEntries;
  }
}
