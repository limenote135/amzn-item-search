import 'dart:io';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:package_info/package_info.dart';
import 'package:pub_semver/pub_semver.dart';

class VersionChecker {
  static const String _androidConfigName = "android_min_app_version";
  static const String _iosConfigName = "ios_min_app_version";

  static String _getConfigName() {
    if (Platform.isAndroid) {
      return _androidConfigName;
    } else {
      return _iosConfigName;
    }
  }

  static Duration _getMinInterval() {
    if (Platform.isIOS) {
      return const Duration(minutes: 5);
    } else {
      return Duration.zero;
    }
  }

  Future<bool> needUpdate() async {
    final info = await PackageInfo.fromPlatform();
    final currentVersion = Version.parse(info.version);

    final remoteConfig = RemoteConfig.instance;
    final configName = _getConfigName();

    try {
      final defaultValues = <String, dynamic>{
        configName: "0.10.0",
      };
      await remoteConfig.setDefaults(defaultValues);
      await remoteConfig.setConfigSettings(
        RemoteConfigSettings(
            fetchTimeout: const Duration(seconds: 5),
            minimumFetchInterval: _getMinInterval()),
      );
      await remoteConfig.fetchAndActivate();
      final minVersion = remoteConfig.getString(configName);
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
