import 'package:flutter/material.dart';

class TextListTile extends StatelessWidget {
  const TextListTile({
    Key key,
    @required this.leading,
    @required this.main,
  }) : super(key: key);

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
    Key key,
    @required this.leading,
    @required this.main,
  }) : super(key: key);

  final Widget leading;
  final Widget main;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        leading,
        const Spacer(),
        main,
      ],
    );
  }
}
