import 'package:flutter/material.dart';

const strongTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.red,
);

const blackTextStyle = TextStyle(color: Colors.black87);

TextStyle? bigFontSize(BuildContext context) =>
    Theme.of(context).textTheme.headline5;

TextStyle? middleFontSize(BuildContext context) =>
    Theme.of(context).textTheme.bodyText1;

TextStyle? smallFontSize(BuildContext context) =>
    Theme.of(context).textTheme.overline;

TextStyle? captionSize(BuildContext context) =>
    Theme.of(context).textTheme.caption;

TextStyle captionSizeBlackText(BuildContext context) =>
    Theme.of(context).textTheme.caption!.apply(color: Colors.black);
