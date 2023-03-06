import 'package:flutter/material.dart';

class TextIconButton extends StatelessWidget {
  const TextIconButton({
    super.key,
    required this.onTap,
    required this.icon,
    required this.text,
  });

  final void Function() onTap;
  final Icon icon;
  final Widget text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          const SizedBox(height: 5),
          text,
        ],
      ),
    );
  }
}
