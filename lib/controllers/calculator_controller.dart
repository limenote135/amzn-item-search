import 'package:amasearch/models/calc_data.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final calculatorControllerProvider = StateNotifierProvider.family<
    CalculateDataController, CalculateData, String>(
  (ref, _) => CalculateDataController(),
);

class CalculateDataController extends StateNotifier<CalculateData> {
  CalculateDataController() : super(const CalculateData());

  void pushNumber(String number) {
    if (state.inputComplete || state.displayText == "0" && number != ".") {
      state = state.copyWith(
        displayText: number,
        inputComplete: false,
      );
      return;
    }
    state = state.copyWith(
      displayText: "${state.displayText}$number",
    );
  }

  void pushRatio(double ratio) {
    var val = double.tryParse(state.displayText);
    if (val == null) {
      return;
    }
    val = (val * ratio * 1000).round() / 1000;

    // 小数以下が無い場合は省略する
    final toInt = val.toInt();
    final isInt = val == toInt;
    state = state.copyWith(
      displayText: isInt ? "$toInt" : "$val",
      inputComplete: true,
    );
  }

  void pushOp(CalcOp op) {
    if (state.inputComplete) {
      if (state.op == CalcOp.equal) {
        state = state.copyWith(
          total: double.parse(state.displayText),
          op: op,
        );
      } else {
        state = state.copyWith(op: op);
      }
      return;
    }

    final subTotal = _calc(state.total, state.displayText, state.op);
    final toInt = subTotal.toInt();
    final isInt = subTotal == toInt;

    state = state.copyWith(
      displayText: isInt ? "$toInt" : "$subTotal",
      total: op == CalcOp.equal ? 0 : subTotal,
      op: op,
      inputComplete: true,
    );
  }

  void clear() {
    state = const CalculateData();
  }

  double calc() {
    pushOp(CalcOp.equal);
    return double.parse(state.displayText);
  }

  double _calc(double total, String current, CalcOp op) {
    final val = double.tryParse(current);
    if (val == null) {
      return 0;
    }
    switch (op) {
      case CalcOp.plus:
        return total + val;
      case CalcOp.minus:
        return total - val;
      case CalcOp.multiple:
        return (total * val * 1000).round() / 1000;
      case CalcOp.division:
        return val == 0 ? 0 : (total / val * 1000).round() / 1000;
      case CalcOp.equal:
        return val;
    }
  }
}
