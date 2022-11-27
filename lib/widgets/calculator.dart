import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/analytics/events.dart';
import 'package:amasearch/controllers/calculator_controller.dart';
import 'package:amasearch/models/calc_data.dart';
import 'package:amasearch/util/util.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Calculator extends HookConsumerWidget {
  const Calculator({
    super.key,
    required this.asin,
    required this.firstButtonText,
    required this.onFirstButtonPushed,
    required this.secondButtonText,
    required this.onSecondButtonPushed,
  });

  final String asin;
  final String firstButtonText;
  final String secondButtonText;
  final void Function(double val) onFirstButtonPushed;
  final void Function(double val) onSecondButtonPushed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calcData = ref.watch(calculatorControllerProvider(asin));

    return OutlinedButtonTheme(
      data: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          // ボタンの高さを調整
          minimumSize: const Size(52, 48),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 4,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          calcData.displayText,
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                    _ExpandedButton(
                      onPressed: () {
                        ref
                            .read(calculatorControllerProvider(asin).notifier)
                            .clear();
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor:
                            isDark(context) ? Colors.white70 : Colors.black87,
                        backgroundColor:
                            isDark(context) ? Colors.white12 : Colors.black12,
                      ),
                      child: const Text("C"),
                    ),
                  ],
                ),
                Row(
                  children: [
                    _ExpandedButton(
                      onPressed: () => ref
                          .read(calculatorControllerProvider(asin).notifier)
                          .pushNumber("7"),
                      child: const Text("7"),
                    ),
                    _ExpandedButton(
                      onPressed: () => ref
                          .read(calculatorControllerProvider(asin).notifier)
                          .pushNumber("8"),
                      child: const Text("8"),
                    ),
                    _ExpandedButton(
                      onPressed: () => ref
                          .read(calculatorControllerProvider(asin).notifier)
                          .pushNumber("9"),
                      child: const Text("9"),
                    ),
                    _OperatorButton(
                      onPressed: () async {
                        ref
                            .read(calculatorControllerProvider(asin).notifier)
                            .pushOp(CalcOp.division);
                        await ref
                            .read(analyticsControllerProvider)
                            .logCalcEvent(calcEventDiv);
                      },
                      child: const Text("÷"),
                    ),
                  ],
                ),
                Row(
                  children: [
                    _ExpandedButton(
                      onPressed: () => ref
                          .read(calculatorControllerProvider(asin).notifier)
                          .pushNumber("4"),
                      child: const Text("4"),
                    ),
                    _ExpandedButton(
                      onPressed: () => ref
                          .read(calculatorControllerProvider(asin).notifier)
                          .pushNumber("5"),
                      child: const Text("5"),
                    ),
                    _ExpandedButton(
                      onPressed: () => ref
                          .read(calculatorControllerProvider(asin).notifier)
                          .pushNumber("6"),
                      child: const Text("6"),
                    ),
                    _OperatorButton(
                      onPressed: () async {
                        ref
                            .read(calculatorControllerProvider(asin).notifier)
                            .pushOp(CalcOp.multiple);
                        await ref
                            .read(analyticsControllerProvider)
                            .logCalcEvent(calcEventMul);
                      },
                      child: const Text("×"),
                    ),
                  ],
                ),
                Row(
                  children: [
                    _ExpandedButton(
                      onPressed: () => ref
                          .read(calculatorControllerProvider(asin).notifier)
                          .pushNumber("1"),
                      child: const Text("1"),
                    ),
                    _ExpandedButton(
                      onPressed: () => ref
                          .read(calculatorControllerProvider(asin).notifier)
                          .pushNumber("2"),
                      child: const Text("2"),
                    ),
                    _ExpandedButton(
                      onPressed: () => ref
                          .read(calculatorControllerProvider(asin).notifier)
                          .pushNumber("3"),
                      child: const Text("3"),
                    ),
                    _OperatorButton(
                      onPressed: () async {
                        ref
                            .read(calculatorControllerProvider(asin).notifier)
                            .pushOp(CalcOp.minus);
                        await ref
                            .read(analyticsControllerProvider)
                            .logCalcEvent(calcEventMinus);
                      },
                      child: const Text("-"),
                    ),
                  ],
                ),
                Row(
                  children: [
                    _ExpandedButton(
                      onPressed: () => ref
                          .read(calculatorControllerProvider(asin).notifier)
                          .pushNumber("."),
                      child: const Text("."),
                    ),
                    _ExpandedButton(
                      onPressed: () => ref
                          .read(calculatorControllerProvider(asin).notifier)
                          .pushNumber("0"),
                      child: const Text("0"),
                    ),
                    _OperatorButton(
                      onPressed: () => ref
                          .read(calculatorControllerProvider(asin).notifier)
                          .pushOp(CalcOp.equal),
                      child: const Text("="),
                    ),
                    _OperatorButton(
                      onPressed: () async {
                        ref
                            .read(calculatorControllerProvider(asin).notifier)
                            .pushOp(CalcOp.plus);
                        await ref
                            .read(analyticsControllerProvider)
                            .logCalcEvent(calcEventPlus);
                      },
                      child: const Text("+"),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Row(
                  children: [
                    _ExpandedButton(
                      style: OutlinedButton.styleFrom(padding: EdgeInsets.zero),
                      onPressed: () async {
                        ref
                            .read(calculatorControllerProvider(asin).notifier)
                            .pushRatio(1.05);
                        await ref
                            .read(analyticsControllerProvider)
                            .logCalcEvent(calcEventPlus5p);
                      },
                      child: const Text("+5%"),
                    ),
                    _ExpandedButton(
                      style: OutlinedButton.styleFrom(padding: EdgeInsets.zero),
                      onPressed: () async {
                        ref
                            .read(calculatorControllerProvider(asin).notifier)
                            .pushRatio(0.95);
                        await ref
                            .read(analyticsControllerProvider)
                            .logCalcEvent(calcEventMinus5p);
                      },
                      child: const Text("-5%"),
                    ),
                  ],
                ),
                Row(
                  children: [
                    _ExpandedButton(
                      style: OutlinedButton.styleFrom(padding: EdgeInsets.zero),
                      onPressed: () async {
                        ref
                            .read(calculatorControllerProvider(asin).notifier)
                            .pushRatio(1.1);
                        await ref
                            .read(analyticsControllerProvider)
                            .logCalcEvent(calcEventPlus10p);
                      },
                      child: const Text("+10%"),
                    ),
                    _ExpandedButton(
                      style: OutlinedButton.styleFrom(padding: EdgeInsets.zero),
                      onPressed: () async {
                        ref
                            .read(calculatorControllerProvider(asin).notifier)
                            .pushRatio(0.9);
                        await ref
                            .read(analyticsControllerProvider)
                            .logCalcEvent(calcEventMinus10p);
                      },
                      child: const Text("-10%"),
                    ),
                  ],
                ),
                Row(
                  children: [
                    _ExpandedButton(
                      style: OutlinedButton.styleFrom(padding: EdgeInsets.zero),
                      onPressed: () async {
                        final val = ref
                            .read(calculatorControllerProvider(asin).notifier)
                            .calc();
                        onFirstButtonPushed(val);
                        await ref
                            .read(analyticsControllerProvider)
                            .logCalcEvent(calcEventFirstAction);
                      },
                      child: Text(firstButtonText),
                    ),
                  ],
                ),
                Row(
                  children: [
                    _ExpandedButton(
                      style: OutlinedButton.styleFrom(padding: EdgeInsets.zero),
                      onPressed: () async {
                        final val = ref
                            .read(calculatorControllerProvider(asin).notifier)
                            .calc();
                        onSecondButtonPushed(val);
                        await ref
                            .read(analyticsControllerProvider)
                            .logCalcEvent(calcEventSecondAction);
                      },
                      child: Text(secondButtonText),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _ExpandedButton extends StatelessWidget {
  const _ExpandedButton({
    this.style,
    this.onPressed,
    required this.child,
  });

  final ButtonStyle? style;
  final void Function()? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
        style: style,
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}

class _OperatorButton extends StatelessWidget {
  const _OperatorButton({
    this.onPressed,
    required this.child,
  });

  final void Function()? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return _ExpandedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black87,
        backgroundColor: Colors.orange[300],
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
