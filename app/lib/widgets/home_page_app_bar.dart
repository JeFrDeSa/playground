import 'package:flutter/material.dart';
import 'package:widgets/sizing/fitted_text_box.dart';

/// Default [AppBar] used for all app pages.
class HomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String pageTitle;
  final int? pageNumber;

  /// Creates an [AppBar] with a [pageTitle]. By providing a [pageNumber]
  /// the [AppBar.actions] will contain a page number entry (e.g. 'Page 3').
  const HomePageAppBar({
    super.key,
    required this.pageTitle,
    this.pageNumber,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: _createPageTitleWidget(context),
      actions: [if (pageNumber != null) _createPageNumberWidget(context)],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);

  Widget _createPageTitleWidget(BuildContext context) {
    return FittedTextBox(
      child: Text(
        pageTitle,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }

  Widget _createPageNumberWidget(BuildContext context) {
    return SizedBox(
      width: 90,
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            "Page $pageNumber",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }
}
