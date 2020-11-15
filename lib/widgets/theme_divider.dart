import 'package:flutter/material.dart';

class ThemeDivider extends StatelessWidget {
  const ThemeDivider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = DividerTheme.of(context);
    return Divider(
      color: theme.color,
      thickness: theme.thickness,
      indent: theme.indent,
      endIndent: theme.endIndent,
      height: 5,
    );
  }
}
