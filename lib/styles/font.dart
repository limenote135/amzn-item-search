import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const strongTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.red,
);

TextStyle smallFontSize(BuildContext context) =>
    Theme.of(context).textTheme.overline;
