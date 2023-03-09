import 'package:amasearch/util/error_report.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class Information {
  static const String _configNameInformation = "info";

  Future<String> get() async {
    final remoteConfig = FirebaseRemoteConfig.instance;

    try {
      final defaultValues = <String, dynamic>{
        _configNameInformation: "",
      };
      await remoteConfig.setDefaults(defaultValues);
      await remoteConfig.fetchAndActivate();
      final info = remoteConfig.getString(_configNameInformation);
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
