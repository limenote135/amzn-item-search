import 'package:amasearch/util/custom_validator.dart';
import 'package:amasearch/util/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

void onTapOutside(PointerDownEvent event) {
  unfocus();
}

class RangeTextField extends HookConsumerWidget {
  const RangeTextField({
    super.key,
    required this.form,
    required this.lowerControlName,
    required this.upperControlName,
    this.suffix = "円",
  });

  final String suffix;

  final FormGroup form;
  final String lowerControlName;
  final String upperControlName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final borderColor =
        theme.brightness == Brightness.light ? Colors.black54 : Colors.white54;

    final lowerFocusNode = useFocusNode();
    final upperFocusNode = useFocusNode();
    final lowerController = useTextEditingController();
    final upperController = useTextEditingController();

    lowerFocusNode.addListener(() {
      final text = lowerController.text;
      if (!lowerFocusNode.hasFocus || text == "") {
        return;
      }
      lowerController.value = lowerController.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: 0, extentOffset: text.length),
      );
    });

    upperFocusNode.addListener(() {
      final text = upperController.text;
      if (!upperFocusNode.hasFocus || text == "") {
        return;
      }
      upperController.value = upperController.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: 0, extentOffset: text.length),
      );
    });

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: theme.inputDecorationTheme.fillColor,
        border: Border.all(
          color: borderColor,
          // style: BorderStyle.none,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(4)),
      ),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ReactiveTextField<String>(
              formControlName: lowerControlName,
              controller: lowerController,
              focusNode: lowerFocusNode,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "下限",
                suffix: Text(suffix),
                isDense: true,
              ),
              validationMessages: {
                validationMessagePositiveNumberOrEmpty: (_) => "不正な値です",
              },
              onSubmitted: (control) => form.focus(upperControlName),
              onTapOutside: onTapOutside,
            ),
          ),
          const Center(
            child: Text(" ～ "),
          ),
          Expanded(
            child: ReactiveTextField<dynamic>(
              formControlName: upperControlName,
              controller: upperController,
              focusNode: upperFocusNode,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "上限",
                suffix: Text(suffix),
                isDense: true,
              ),
              validationMessages: {
                validationMessagePositiveNumberOrEmpty: (_) => "不正な値です",
              },
              onTapOutside: onTapOutside,
            ),
          ),
        ],
      ),
    );
  }
}
