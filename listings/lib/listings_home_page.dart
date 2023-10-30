import 'package:app/widgets/home_page.dart';
import 'package:flutter/material.dart';
import 'package:listings/list_element_state/list_element_state_refresh.dart';

class _ListingsHomePageKeys {
  const _ListingsHomePageKeys._();

  final pageKey = const ValueKey("listing-home-page");
}

class ListingsHomePage extends StatelessWidget {
  static const keys = _ListingsHomePageKeys._();

  final pages = const [
    ListElementStateRefreshBehaviour(),
    Placeholder(color: Colors.red),
    Placeholder(color: Colors.green),
    Placeholder(color: Colors.blue),
  ];

  const ListingsHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomePage(
      subPageTitle: "Listings",
      pages: pages,
    );
  }
}
