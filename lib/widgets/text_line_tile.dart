import 'package:flutter/material.dart';

class TextListTile extends StatelessWidget {
  const TextListTile({
    super.key,
    required this.leading,
    required this.main,
  });

  final Widget leading;
  final Widget main;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TextLine(leading: leading, main: main),
    );
  }
}

class TextLine extends StatelessWidget {
  const TextLine({
    super.key,
    required this.leading,
    required this.main,
  });

  final Widget leading;
  final Widget main;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: leading,
        ),
        Flexible(child: main),
      ],
    );
  }
}
