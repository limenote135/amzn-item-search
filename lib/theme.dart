import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const _schemaColor = FlexScheme.gold;

final lightTheme = FlexColorScheme.light(
  scheme: _schemaColor,
  appBarStyle: FlexAppBarStyle.surface,
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
).toTheme.copyWith(
      dividerTheme: const DividerThemeData(
        color: Colors.grey,
      ),
    );

final darkTheme = FlexColorScheme.dark(
  scheme: _schemaColor,
  visualDensity: VisualDensity.adaptivePlatformDensity,
).toTheme.copyWith(
      dividerTheme: const DividerThemeData(
        color: Colors.white,
      ),
      cupertinoOverrideTheme: const CupertinoThemeData(
        textTheme: CupertinoTextThemeData(),
      ),
    );
