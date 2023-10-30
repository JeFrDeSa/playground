import 'package:flutter/material.dart';
import 'package:app/app_home_page.dart';
import 'package:app_theme/theme_data.dart' as theme_data;
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const PlaygroundAppContainer());
}

class PlaygroundAppContainer extends StatefulWidget {
  const PlaygroundAppContainer({Key? key}) : super(key: key);

  @override
  State<PlaygroundAppContainer> createState() => _PlaygroundAppContainerState();
}

class _PlaygroundAppContainerState extends State<PlaygroundAppContainer> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Playground',
      theme: theme_data.lightTheme,
      darkTheme: theme_data.darkTheme,
      debugShowCheckedModeBanner: false,
      home: AppHomePage(key: AppHomePage.keys.pageKey),
    );
  }
}
