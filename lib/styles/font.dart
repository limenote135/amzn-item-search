import 'package:flutter/material.dart';

const strongTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.red,
);

const blackTextStyle = TextStyle(color: Colors.black87);

TextStyle? headlineFontSize(BuildContext context) =>
    Theme.of(context).textTheme.headlineSmall;

TextStyle? largeFontSize(BuildContext context) =>
    Theme.of(context).textTheme.bodyLarge;

TextStyle? middleFontSize(BuildContext context) =>
    Theme.of(context).textTheme.bodyMedium;

TextStyle? smallFontSize(BuildContext context) =>
    Theme.of(context).textTheme.labelSmall;

TextStyle smallFontSizeRedText(BuildContext context) =>
    Theme.of(context).textTheme.labelSmall!.apply(color: Colors.red);

TextStyle? captionFontSize(BuildContext context) =>
    Theme.of(context).textTheme.bodySmall;

TextStyle captionFontSizeBlackText(BuildContext context) =>
    Theme.of(context).textTheme.bodySmall!.apply(color: Colors.black);
