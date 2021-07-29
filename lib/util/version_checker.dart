import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:package_info/package_info.dart';
import 'package:pub_semver/pub_semver.dart';

class VersionChecker {
  static const String _configName = "min_app_version";

  Future<bool> needUpdate() async {
    final info = await PackageInfo.fromPlatform();
    final currentVersion = Version.parse(info.version);

    final remoteConfig = RemoteConfig.instance;

    try {
      final defaultValues = <String, dynamic>{
        _configName: "0.10.0",
      };
      await remoteConfig.setDefaults(defaultValues);
      await remoteConfig.fetchAndActivate();
      final minVersion = remoteConfig.getString(_configName);
      final requiredVersion = Version.parse(minVersion);

      return currentVersion.compareTo(requiredVersion).isNegative;
      // ignore: avoid_catches_without_on_clauses
    } catch (exception, stackTrace) {
      // 取得失敗してもエラーにしない
      await FirebaseCrashlytics.instance.recordError(exception, stackTrace);
    }
    return false;
  }
}
