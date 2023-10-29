import 'package:app/app_home_page.dart';
import 'package:app/widgets/home_page.dart';
import 'package:flutter/material.dart';
import 'package:widgets/sizing/fitted_text_box.dart';
import 'package:app_theme/ui_properties.dart' as ui_properties;

/// Default Button used by the [AppHomePage] to navigate to
/// the different [HomePage]s.
class PageSelectionButton extends StatefulWidget {
  final String title;
  final Widget illustration;
  final void Function()? onPressed;

  /// Creates a [GridView] entry for the [AppHomePage] with a [title]
  /// and a suitable widget as [illustration] of the related topic.
  const PageSelectionButton({
    Key? key,
    required this.title,
    required this.illustration,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<PageSelectionButton> createState() => _PageSelectionButtonState();
}

class _PageSelectionButtonState extends State<PageSelectionButton> {
  late final double spacing;
  late final double topSpacing;

  @override
  void initState() {
    // Spend enough space to not overlap the rounded corner.
    topSpacing = ui_properties.widgetBoarderRadius.x;
    spacing = topSpacing * 0.5;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Card(
          child: Column(
            children: [
              SizedBox(height: topSpacing),
              Container(
                // TODO(Material Design): Why is the text color not onSecondary?
                // Understand Material Design
                //
                //  Expected: Since the color of the container is secondary,
                //  the color of the text below should be onSecondary.
                //  Current: The color of the text is as defined by the textTheme
                //  always onPrimaryColor regardless of the parent color.
                color: Theme.of(context).colorScheme.secondary,
                alignment: Alignment.center,
                child: FittedTextBox(
                  child: Text(
                    widget.title,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                  ),
                ),
              ),
              SizedBox(height: spacing),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: spacing,
                    right: spacing,
                    bottom: spacing,
                  ),
                  child: MaterialButton(
                    color: Theme.of(context).colorScheme.tertiary,
                    shape: Theme.of(context).cardTheme.shape,
                    onPressed: widget.onPressed,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: spacing),
                      child: widget.illustration,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
