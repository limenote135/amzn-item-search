import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:package_info/package_info.dart';

class VersionChecker {
  static const String _configName = "min_version";

  Future<bool> needUpdate() async {
    final info = await PackageInfo.fromPlatform();
    final currentVersion = int.parse(info.buildNumber);

    final remoteConfig = await RemoteConfig.instance;

    try {
      final defaultValues = <String, dynamic>{
        _configName: 0,
      };
      await remoteConfig.setDefaults(defaultValues);
      await remoteConfig.fetch(expiration: const Duration(seconds: 0));
      await remoteConfig.activateFetched();
      final minVersion = remoteConfig.getInt(_configName);
      if (minVersion > currentVersion) {
        return true;
      }
    } on FetchThrottledException catch (exception) {
      // Fetch throttled.
      print(exception);
    } catch (exception) {
      print('Unable to fetch remote config. Cached or default values will be '
          'used');
    }
    return false;
  }
}
