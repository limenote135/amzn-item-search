import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/analytics/events.dart';
import 'package:amasearch/util/util.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _displayTextProvider = StateProvider.autoDispose<String>((_) => "0");
final _totalProvider = StateProvider.autoDispose<double>((_) => 0);
final _currentOp = StateProvider.autoDispose<_Op>((_) => _Op.equal);
final _inputCompleteProvider = StateProvider.autoDispose<bool>((_) => true);

enum _Op {
  plus,
  minus,
  multiple,
  division,
  equal,
}

class Calculator extends HookConsumerWidget {
  const Calculator({
    super.key,
    required this.firstButtonText,
    required this.onFirstButtonPushed,
    required this.secondButtonText,
    required this.onSecondButtonPushed,
  });

  final String firstButtonText;
  final String secondButtonText;
  final void Function(double val) onFirstButtonPushed;
  final void Function(double val) onSecondButtonPushed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final displayText = ref.watch(_displayTextProvider.state);
    final total = ref.watch(_totalProvider.state);
    final op = ref.watch(_currentOp.state);
    final inputComplete = ref.watch(_inputCompleteProvider.state);

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
                          displayText.state,
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                    _ExpandedButton(
                      onPressed: () {
                        displayText.state = "0";
                        op.state = _Op.plus;
                        total.state = 0;
                        inputComplete.state = true;
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
                      onPressed: () =>
                          _pushNumber(displayText, "7", inputComplete),
                      child: const Text("7"),
                    ),
                    _ExpandedButton(
                      onPressed: () =>
                          _pushNumber(displayText, "8", inputComplete),
                      child: const Text("8"),
                    ),
                    _ExpandedButton(
                      onPressed: () =>
                          _pushNumber(displayText, "9", inputComplete),
                      child: const Text("9"),
                    ),
                    _OperatorButton(
                      onPressed: () async {
                        _pushOp(
                          displayText,
                          total,
                          op,
                          inputComplete,
                          _Op.division,
                        );
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
                      onPressed: () =>
                          _pushNumber(displayText, "4", inputComplete),
                      child: const Text("4"),
                    ),
                    _ExpandedButton(
                      onPressed: () =>
                          _pushNumber(displayText, "5", inputComplete),
                      child: const Text("5"),
                    ),
                    _ExpandedButton(
                      onPressed: () =>
                          _pushNumber(displayText, "6", inputComplete),
                      child: const Text("6"),
                    ),
                    _OperatorButton(
                      onPressed: () async {
                        _pushOp(
                          displayText,
                          total,
                          op,
                          inputComplete,
                          _Op.multiple,
                        );
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
                      onPressed: () =>
                          _pushNumber(displayText, "1", inputComplete),
                      child: const Text("1"),
                    ),
                    _ExpandedButton(
                      onPressed: () =>
                          _pushNumber(displayText, "2", inputComplete),
                      child: const Text("2"),
                    ),
                    _ExpandedButton(
                      onPressed: () =>
                          _pushNumber(displayText, "3", inputComplete),
                      child: const Text("3"),
                    ),
                    _OperatorButton(
                      onPressed: () async {
                        _pushOp(
                          displayText,
                          total,
                          op,
                          inputComplete,
                          _Op.minus,
                        );
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
                      onPressed: () =>
                          _pushNumber(displayText, ".", inputComplete),
                      child: const Text("."),
                    ),
                    _ExpandedButton(
                      onPressed: () =>
                          _pushNumber(displayText, "0", inputComplete),
                      child: const Text("0"),
                    ),
                    _OperatorButton(
                      onPressed: () => _pushOp(
                        displayText,
                        total,
                        op,
                        inputComplete,
                        _Op.equal,
                      ),
                      child: const Text("="),
                    ),
                    _OperatorButton(
                      onPressed: () async {
                        _pushOp(
                          displayText,
                          total,
                          op,
                          inputComplete,
                          _Op.plus,
                        );
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
                        _pushRatio(displayText, total, inputComplete, 1.05);
                        await ref
                            .read(analyticsControllerProvider)
                            .logCalcEvent(calcEventPlus5p);
                      },
                      child: const Text("+5%"),
                    ),
                    _ExpandedButton(
                      style: OutlinedButton.styleFrom(padding: EdgeInsets.zero),
                      onPressed: () async {
                        _pushRatio(displayText, total, inputComplete, 0.95);
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
                        _pushRatio(displayText, total, inputComplete, 1.1);
                        await ref
                            .read(analyticsControllerProvider)
                            .logCalcEvent(calcEventPlus10p);
                      },
                      child: const Text("+10%"),
                    ),
                    _ExpandedButton(
                      style: OutlinedButton.styleFrom(padding: EdgeInsets.zero),
                      onPressed: () async {
                        _pushRatio(displayText, total, inputComplete, 0.9);
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
                        final calcOp =
                            inputComplete.state ? _Op.equal : op.state;
                        final val =
                            _calc(total.state, displayText.state, calcOp);
                        _pushOp(
                          displayText,
                          total,
                          op,
                          inputComplete,
                          _Op.equal,
                        );
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
                        final calcOp =
                            inputComplete.state ? _Op.equal : op.state;
                        final val =
                            _calc(total.state, displayText.state, calcOp);
                        _pushOp(
                          displayText,
                          total,
                          op,
                          inputComplete,
                          _Op.equal,
                        );
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

  void _pushNumber(
    StateController<String> current,
    String str,
    StateController<bool> inputComplete,
  ) {
    if (inputComplete.state || current.state == "0" && str != ".") {
      current.state = str;
      inputComplete.state = false;
      return;
    }
    current.state += str;
  }

  void _pushRatio(
    StateController<String> current,
    StateController<double> total,
    StateController<bool> inputComplete,
    double ratio,
  ) {
    var val = double.tryParse(current.state);
    if (val == null) {
      return;
    }
    val = (val * ratio * 1000).round() / 1000;

    final toInt = val.toInt();
    final isInt = val == toInt;
    current.state = isInt ? "$toInt" : "$val";

    inputComplete.state = true;
  }

  double _calc(double total, String current, _Op op) {
    final val = double.tryParse(current);
    if (val == null) {
      return 0;
    }
    switch (op) {
      case _Op.plus:
        return total + val;
      case _Op.minus:
        return total - val;
      case _Op.multiple:
        return (total * val * 1000).round() / 1000;
      case _Op.division:
        return val == 0 ? 0 : (total / val * 1000).round() / 1000;
      case _Op.equal:
        return val;
    }
  }

  void _pushOp(
    StateController<String> current,
    StateController<double> total,
    StateController<_Op> currentOp,
    StateController<bool> inputComplete,
    _Op nextOp,
  ) {
    if (inputComplete.state) {
      if (currentOp.state == _Op.equal) {
        total.state = double.parse(current.state);
      }
      currentOp.state = nextOp;
      return;
    }
    total.state = _calc(total.state, current.state, currentOp.state);
    currentOp.state = nextOp;
    inputComplete.state = true;

    final toInt = total.state.toInt();
    final isInt = total.state == toInt;
    current.state = isInt ? "$toInt" : "${total.state}";

    if (nextOp == _Op.equal) {
      total.state = 0;
      inputComplete.state = true;
    }
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
