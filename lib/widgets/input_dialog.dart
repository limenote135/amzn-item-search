import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class InputDialog<T> extends HookWidget {
  const InputDialog({
    Key? key,
    required this.title,
    required this.validate,
    this.keyboardType,
  }) : super(key: key);

  final Widget title;
  final T Function(String value) validate;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    final val = useState<T?>(null);
    return AlertDialog(
      title: title,
      content: TextField(
        autofocus: true,
        keyboardType: keyboardType,
        onChanged: (value) {
          final validated = validate(value);
          if (validated != null) {
            val.value = validated;
          }
        },
      ),
      actions: [
        FlatButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("キャンセル"),
        ),
        FlatButton(
          onPressed: val.value == null
              ? null
              : () {
                  Navigator.pop<T>(context, val.value);
                },
          child: const Text("OK"),
        ),
      ],
    );
  }
}
