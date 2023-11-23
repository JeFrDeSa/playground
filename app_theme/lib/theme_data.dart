// coverage:ignore-file
import 'package:app_theme/ui_properties.dart' as ui_properties;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// region Dark theme colors

// Theme colors
const _disabledColorDark = Color.fromARGB(0xff, 0x88, 0x88, 0x88);
const _cardColorDark = Color.fromARGB(0xff, 0x42, 0x42, 0x42);
// ColorScheme colors
const _primaryColorDark = Color.fromARGB(0xff, 0x45, 0x5a, 0x64);
const _onPrimaryColorDark = Color.fromARGB(0xff, 0xff, 0xff, 0xff);
const _secondaryColorDark = Color.fromARGB(0xff, 0x90, 0xA4, 0xAE);
const _onSecondaryColorDark = Color.fromARGB(0xff, 0x00, 0x00, 0x00);
const _tertiaryColorDark = Color.fromARGB(0xff, 0x78, 0x00, 0x2e);
const _onTertiaryColorDark = Color.fromARGB(0xff, 0xff, 0xff, 0xff);
const _backgroundColorDark = Color.fromARGB(0xff, 0x19, 0x19, 0x19);
const _onBackgroundColorDark = Color.fromARGB(0xff, 0xff, 0xff, 0xff);
const _surfaceColorDark = Color.fromARGB(0xff, 0x00, 0x00, 0x00);
const _onSurfaceColorDark = Color.fromARGB(0xff, 0xff, 0xff, 0xff);
const _errorColorDark = Color.fromARGB(0xff, 0xB0, 0x00, 0x20);
const _onErrorColorDark = Color.fromARGB(0xff, 0x00, 0x00, 0x00);

// endregion

// region Light theme colors

// Theme colors
const _disabledColorLight = Color.fromARGB(0xff, 0x99, 0x99, 0x99);
const _cardColorLight = Color.fromARGB(0xff, 0xf9, 0xf9, 0xf9);
// ColorScheme colors
const _primaryColorLight = Color.fromARGB(0xff, 0xff, 0xe0, 0x82);
const _onPrimaryColorLight = Color.fromARGB(0xff, 0x00, 0x00, 0x00);
const _secondaryColorLight = Color.fromARGB(0xff, 0xff, 0xec, 0xb3);
const _onSecondaryColorLight = Color.fromARGB(0xff, 0x00, 0x00, 0x00);
const _tertiaryColorLight = Color.fromARGB(0xff, 0xcb, 0xba, 0x83);
const _onTertiaryColorLight = Color.fromARGB(0xff, 0x00, 0x00, 0x00);
const _backgroundColorLight = Color.fromARGB(0xff, 0xe9, 0xe9, 0xe9);
const _onBackgroundColorLight = Color.fromARGB(0xff, 0x00, 0x00, 0x00);
const _surfaceColorLight = Color.fromARGB(0xff, 0xff, 0xff, 0xff);
const _onSurfaceColorLight = Color.fromARGB(0xff, 0x00, 0x00, 0x00);
const _errorColorLight = Color.fromARGB(0xff, 0xB0, 0x00, 0x20);
const _onErrorColorLight = Color.fromARGB(0xff, 0x00, 0x00, 0x00);

// endregion

final darkTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: _backgroundColorDark,
  disabledColor: _disabledColorDark,
  fontFamily: 'LocalAssetFont',
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: _primaryColorDark,
    onPrimary: _onPrimaryColorDark,
    secondary: _secondaryColorDark,
    onSecondary: _onSecondaryColorDark,
    tertiary: _tertiaryColorDark,
    onTertiary: _onTertiaryColorDark,
    background: _backgroundColorDark,
    onBackground: _onBackgroundColorDark,
    surface: _surfaceColorDark,
    onSurface: _onSurfaceColorDark,
    error: _errorColorDark,
    onError: _onErrorColorDark,
  ),
  appBarTheme: _appBarTheme(appBarColor: _primaryColorDark),
  bottomAppBarTheme: _bottomAppBarTheme(
    bottomAppBarColor: _primaryColorDark,
  ),
  textTheme: _textTheme(textColor: _onPrimaryColorDark),
  iconTheme: _iconTheme(iconColor: _onPrimaryColorDark),
  cardTheme: _cardTheme(cardColor: _cardColorDark),
  elevatedButtonTheme: _elevatedButtonTheme(
    buttonColor: _secondaryColorDark,
    foregroundColor: _onSecondaryColorDark,
  ),
  outlinedButtonTheme: _outlinedButtonTheme(
    foregroundColor: _onSecondaryColorDark,
  ),
  textButtonTheme: _textButtonTheme(
    foregroundColor: _onSecondaryColorDark,
  ),
);

final lightTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: _backgroundColorLight,
  disabledColor: _disabledColorLight,
  fontFamily: 'LocalAssetFont',
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: _primaryColorLight,
    onPrimary: _onPrimaryColorLight,
    secondary: _secondaryColorLight,
    tertiary: _tertiaryColorLight,
    onTertiary: _onTertiaryColorLight,
    onSecondary: _onSecondaryColorLight,
    background: _backgroundColorLight,
    onBackground: _onBackgroundColorLight,
    surface: _surfaceColorLight,
    onSurface: _onSurfaceColorLight,
    error: _errorColorLight,
    onError: _onErrorColorLight,
  ),
  appBarTheme: _appBarTheme(appBarColor: _primaryColorLight),
  bottomAppBarTheme: _bottomAppBarTheme(
    bottomAppBarColor: _primaryColorLight,
  ),
  textTheme: _textTheme(textColor: _onPrimaryColorLight),
  iconTheme: _iconTheme(iconColor: _onPrimaryColorLight),
  cardTheme: _cardTheme(cardColor: _cardColorLight),
  elevatedButtonTheme: _elevatedButtonTheme(
    buttonColor: _secondaryColorLight,
    foregroundColor: _onSecondaryColorLight,
  ),
  outlinedButtonTheme: _outlinedButtonTheme(
    foregroundColor: _onSecondaryColorLight,
  ),
  textButtonTheme: _textButtonTheme(
    foregroundColor: _onSecondaryColorLight,
  ),
);

// region --- HELPER ---

AppBarTheme _appBarTheme({required Color appBarColor}) {
  return AppBarTheme(
    backgroundColor: appBarColor,
    elevation: ui_properties.widgetElevationSmall,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: appBarColor,
      systemNavigationBarColor: appBarColor,
    ),
  );
}

BottomAppBarTheme _bottomAppBarTheme({required Color bottomAppBarColor}) {
  return BottomAppBarTheme(
    color: bottomAppBarColor,
    elevation: ui_properties.widgetElevationSmall,
  );
}

TextTheme _textTheme({required Color textColor}) {
  return TextTheme(
    bodySmall: TextStyle(
      color: textColor,
      fontWeight: FontWeight.normal,
      fontSize: 12,
      letterSpacing: 0,
    ),
    bodyMedium: TextStyle(
      color: textColor,
      fontWeight: FontWeight.normal,
      fontSize: 16,
      letterSpacing: 0,
    ),
    bodyLarge: TextStyle(
      color: textColor,
      fontWeight: FontWeight.bold,
      fontSize: 16,
      letterSpacing: 0,
    ),
    headlineSmall: TextStyle(
      color: textColor,
      fontWeight: FontWeight.bold,
      fontSize: 20,
      letterSpacing: 0,
    ),
    headlineMedium: TextStyle(
      color: textColor,
      fontWeight: FontWeight.bold,
      fontSize: 24,
      letterSpacing: 0,
    ),
    headlineLarge: TextStyle(
      color: textColor,
      fontWeight: FontWeight.bold,
      fontSize: 28,
      letterSpacing: 0,
    ),
  );
}

IconThemeData _iconTheme({required Color iconColor}) {
  return IconThemeData(color: iconColor);
}

CardTheme _cardTheme({required Color cardColor}) {
  return CardTheme(
    color: cardColor,
    shape: _defaultRoundedBoarders,
    elevation: ui_properties.widgetElevationMedium,
  );
}

ElevatedButtonThemeData _elevatedButtonTheme({
  required Color buttonColor,
  required Color foregroundColor,
}) {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: foregroundColor,
      backgroundColor: buttonColor,
      shape: _defaultRoundedBoarders,
    ),
  );
}

OutlinedButtonThemeData _outlinedButtonTheme({
  required Color foregroundColor,
}) {
  return OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: foregroundColor,
      backgroundColor: Colors.transparent,
      shape: _defaultRoundedBoarders,
    ),
  );
}

TextButtonThemeData _textButtonTheme({
  required Color foregroundColor,
}) {
  return TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: foregroundColor,
      shape: _defaultRoundedBoarders,
    ),
  );
}

RoundedRectangleBorder _defaultRoundedBoarders = const RoundedRectangleBorder(
  borderRadius: BorderRadius.all(ui_properties.widgetBoarderRadius),
);

// endregion
