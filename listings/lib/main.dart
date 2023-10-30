import 'package:flutter/material.dart';
import 'package:app_theme/theme_data.dart' as theme_data;
import 'package:flutter/services.dart';
import 'package:listings/listings_home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const AnimationsContainer());
}

class AnimationsContainer extends StatelessWidget {
  const AnimationsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Listings',
      theme: theme_data.lightTheme,
      darkTheme: theme_data.darkTheme,
      debugShowCheckedModeBanner: false,
      home: ListingsHomePage(key: ListingsHomePage.keys.pageKey),
    );
  }
}
