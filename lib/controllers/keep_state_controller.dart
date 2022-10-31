import 'package:hooks_riverpod/hooks_riverpod.dart';

final keepStateControllerProvider =
    StateNotifierProvider<KeepStateController, Map<String, bool>>(
  (ref) => KeepStateController(),
);

// Keepリストから購入画面に遷移して戻って来た際に、
// 仕入れたことで戻って来たのかキャンセルして戻って来たのかを管理するためのクラス
// Navigator.popUntil() に戻り値を設定できるようになったら不要になる
class KeepStateController extends StateNotifier<Map<String, bool>> {
  KeepStateController() : super(<String, bool>{});

  void addItem(String key) {
    state = <String, bool>{
      ...state,
      key: false,
    };
  }

  void setAsComplete(String key) {
    state = <String, bool>{
      ...state,
      key: true,
    };
  }

  bool getState(String key) {
    return state[key] ?? false;
  }
}
