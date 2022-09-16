import 'package:flutter/material.dart';

class StrongContainer extends StatelessWidget {
  const StrongContainer(this.child, {super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final newTextTheme = Theme.of(context).textTheme.apply(
          bodyColor: Colors.black,
          displayColor: Colors.black,
        );
    return ColoredBox(
      color: Colors.red.shade100,
      child: Theme(
        data: Theme.of(context).copyWith(textTheme: newTextTheme),
        child: child,
      ),
    );
  }
}
