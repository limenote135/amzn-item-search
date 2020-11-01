import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TargetProfitDialog extends HookWidget {
  const TargetProfitDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rate = useState<int>(null);
    return AlertDialog(
      title: const Text("目標利益率"),
      content: TextField(
        decoration: const InputDecoration(suffixText: "%"),
        autofocus: true,
        keyboardType: TextInputType.number,
        onChanged: (value) {
          final n = int.tryParse(value);
          if(n != null && n > 0) {
            rate.value = n;
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
          onPressed: rate.value == null
              ? null
              : () {
                  Navigator.pop<int>(context, rate.value);
                },
        ),
      ],
    );
  }
}
