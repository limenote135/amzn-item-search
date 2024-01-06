import 'package:flutter/material.dart';

class ThemeDivider extends StatelessWidget {
  const ThemeDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = DividerTheme.of(context);
    return Divider(
      color: theme.color,
      thickness: theme.thickness,
      indent: theme.indent,
      endIndent: theme.endIndent,
      height: 2,
    );
  }
}

class TextDivider extends StatelessWidget {
  const TextDivider({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        const ThemeDivider(),
        Text(text),
      ],
    );
  }
}
