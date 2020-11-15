import 'package:flutter/material.dart';

const _primaryColor = Colors.green;

final lightTheme = ThemeData(
  primarySwatch: _primaryColor,
  // This makes the visual density adapt to the platform that you run
  // the app on. For desktop platforms, the controls will be smaller and
  // closer together (more dense) than on mobile platforms.
  visualDensity: VisualDensity.adaptivePlatformDensity,
  dividerTheme: const DividerThemeData(
    color: Colors.black,
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: _primaryColor,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  dividerTheme: const DividerThemeData(
    color: Colors.white,
  ),
);
