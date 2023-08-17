import 'package:amasearch/util/error_report.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class SupportInfo {
  static const String _configNameSupport = "support";

  Future<String> get() async {
    final remoteConfig = FirebaseRemoteConfig.instance;

    try {
      final defaultValues = <String, dynamic>{
        _configNameSupport: "",
      };
      await remoteConfig.setDefaults(defaultValues);
      await remoteConfig.fetchAndActivate();
      final info = remoteConfig.getString(_configNameSupport);
      return info;

      // ignore: avoid_catches_without_on_clauses
    } catch (e, st) {
      // 取得失敗してもエラーにしない
      await recordError(
        e,
        st,
        information: const ["RemoteConfig error"],
      );
      return "";
    }
  }
}
