import 'package:app/widgets/home_page_app_bar.dart';
import 'package:app_theme/app_theme_home_page.dart';
import 'package:flutter/material.dart';
import 'package:app/widgets/page_selection_button.dart';
import 'package:animations/animations_home_page.dart';
import 'package:listings/listings_home_page.dart';
import 'package:state_management/state_management_home_page.dart';
import 'package:widgets/widgets_home_page.dart';

class _AppHomePageKeys {
  const _AppHomePageKeys._();

  final pageKey = const ValueKey("app-home-page");
  final widgetsPageButtonKey = const ValueKey("widgets-page-button");
  final appThemePageButtonKey = const ValueKey("app-theme-page-button");
  final animationPageButtonKey = const ValueKey("animation-page-button");
  final listingPageButtonKey = const ValueKey("listing-page-button");
  final stateManagementButtonKey =
      const ValueKey("state-management-page-button");
}

class AppHomePage extends StatefulWidget {
  static const keys = _AppHomePageKeys._();

  const AppHomePage({super.key});

  @override
  State<AppHomePage> createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const HomePageAppBar(
          pageTitle: "Playground Home Page",
        ),
        body: GridView.count(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 24.0,
          ),
          crossAxisCount: 2,
          mainAxisSpacing: 12.0,
          crossAxisSpacing: 12.0,
          children: [
            PageSelectionButton(
              key: AppHomePage.keys.appThemePageButtonKey,
              title: "App Theme",
              // TODO(Add widget): PageIllustration()
              illustration: const Placeholder(),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AppThemeHomePage(
                      key: AppThemeHomePage.keys.pageKey,
                    ),
                  ),
                );
              },
            ),
            PageSelectionButton(
              key: AppHomePage.keys.widgetsPageButtonKey,
              title: "Widgets",
              // TODO(Add widget): PageIllustration()
              illustration: const Placeholder(),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => WidgetsHomePage(
                      key: WidgetsHomePage.keys.pageKey,
                    ),
                  ),
                );
              },
            ),
            PageSelectionButton(
              key: AppHomePage.keys.animationPageButtonKey,
              title: "Animations",
              // TODO(Add widget): PageIllustration()
              illustration: const Placeholder(),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AnimationsHomePage(
                      key: AnimationsHomePage.keys.pageKey,
                    ),
                  ),
                );
              },
            ),
            PageSelectionButton(
              key: AppHomePage.keys.listingPageButtonKey,
              title: "Listings",
              // TODO(Add widget): PageIllustration()
              illustration: const Placeholder(),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ListingsHomePage(
                      key: ListingsHomePage.keys.pageKey,
                    ),
                  ),
                );
              },
            ),
            PageSelectionButton(
              key: AppHomePage.keys.stateManagementButtonKey,
              title: "State Management",
              // TODO(Add widget): PageIllustration()
              illustration: const Placeholder(),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => StateManagementHomePage(
                      key: StateManagementHomePage.keys.pageKey,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
