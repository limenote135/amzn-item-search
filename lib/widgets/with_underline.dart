import 'package:amasearch/widgets/theme_divider.dart';
import 'package:flutter/material.dart';

class WithUnderLine extends StatelessWidget {
  const WithUnderLine(this.child, {super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        child,
        const ThemeDivider(),
      ],
    );
  }
}
