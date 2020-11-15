import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class InputDialog<T> extends HookWidget {
  const InputDialog({
    Key key,
    @required this.title,
    @required this.validate,
  }) : super(key: key);

  final Widget title;
  final T Function(String value) validate;

  @override
  Widget build(BuildContext context) {
    final val = useState<T>(null);
    return AlertDialog(
      title: title,
      content: TextField(
        autofocus: true,
        onChanged: (value) {
          final validated = validate(value);
          if (val != null) {
            val.value = validated;
          }
        },
      ),
      actions: [
        FlatButton(
          child: const Text("キャンセル"),
          onPressed: () => Navigator.pop(context),
        ),
        FlatButton(
          child: const Text("OK"),
          onPressed: val.value == null
              ? null
              : () {
                  Navigator.pop<T>(context, val.value);
                },
        ),
      ],
    );
  }
}
