import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:package_info/package_info.dart';
import 'package:pub_semver/pub_semver.dart';

class VersionChecker {
  static const String _configName = "android_min_app_version"; // TODO: iOS での対応

  Future<bool> needUpdate() async {
    final info = await PackageInfo.fromPlatform();
    final currentVersion = Version.parse(info.version);

    final remoteConfig = await RemoteConfig.instance;

    try {
      final defaultValues = <String, dynamic>{
        _configName: "0.2.2",
      };
      await remoteConfig.setDefaults(defaultValues);
      await remoteConfig.fetch(expiration: const Duration(seconds: 0));
      await remoteConfig.activateFetched();
      final minVersion = remoteConfig.getString(_configName);
      final requiredVersion = Version.parse(minVersion);

      return currentVersion.compareTo(requiredVersion).isNegative;
    } on FetchThrottledException catch (exception, stackTrace) {
      // Fetch throttled.
      print(exception);
      await FirebaseCrashlytics.instance.recordError(exception, stackTrace);
      // ignore: avoid_catches_without_on_clauses
    } catch (exception, stackTrace) {
      print('Unable to fetch remote config. Cached or default values will be '
          'used');
      await FirebaseCrashlytics.instance.recordError(exception, stackTrace);
    }
    return false;
  }
}
