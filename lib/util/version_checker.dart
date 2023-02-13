import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pub_semver/pub_semver.dart';

import 'error_report.dart';

class VersionChecker {
  static const String _configNameMinVersion = "min_app_version";
  static const String _configNameBlackList = "blacklist";

  Future<bool> needUpdate() async {
    final info = await PackageInfo.fromPlatform();
    final currentVersion = Version.parse(info.version);

    final remoteConfig = FirebaseRemoteConfig.instance;

    try {
      final defaultValues = <String, dynamic>{
        _configNameMinVersion: "1.8.4",
        _configNameBlackList: "[]",
      };
      await remoteConfig.setDefaults(defaultValues);
      await remoteConfig.fetchAndActivate();
      final minVersion = remoteConfig.getString(_configNameMinVersion);
      final requiredVersion = Version.parse(minVersion);

      final blacklistRaw = remoteConfig.getString(_configNameBlackList);
      if (blacklistRaw.isNotEmpty) {
        final blacklist = jsonDecode(blacklistRaw) as List<dynamic>;
        for (final v in blacklist) {
          if (v == currentVersion.toString()) {
            return true;
          }
        }
      }

      return currentVersion.compareTo(requiredVersion).isNegative;
      // ignore: avoid_catches_without_on_clauses
    } catch (exception, stackTrace) {
      // 取得失敗してもエラーにしない
      await recordError(
        exception,
        stackTrace,
        information: const ["RemoteConfig error"],
      );
    }
    return false;
  }
}
