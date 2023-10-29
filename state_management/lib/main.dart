import 'package:flutter/material.dart';
import 'package:app_theme/theme_data.dart' as theme_data;
import 'package:flutter/services.dart';
import 'package:state_management/state_management_home_page.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const AppThemeContainer());
}

class AppThemeContainer extends StatelessWidget {
  const AppThemeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App State Management',
      theme: theme_data.lightTheme,
      darkTheme: theme_data.darkTheme,
      debugShowCheckedModeBanner: false,
      home: StateManagementHomePage(
        key: StateManagementHomePage.keys.pageKey,
      ),
    );
  }
}
