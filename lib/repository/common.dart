import 'package:amasearch/util/device.dart';
import 'package:amasearch/util/error_report.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

const janCodeLength = 13;

const _kTestingServer = false;
const _localServerUrl = "http://192.168.2.201:8080";
const _defaultServerUrl = "https://api.amasearch.app.knz-c.com";
const _serverUrlConfigName = "server_url";

final serverUrlProvider = FutureProvider<String>((_) async {
  if (_kTestingServer) {
    return Future.value(_localServerUrl);
  }
  final remoteConfig = FirebaseRemoteConfig.instance;
  try {
    final defaultValues = <String, dynamic>{
      _serverUrlConfigName: _defaultServerUrl,
    };
    await remoteConfig.setDefaults(defaultValues);
    await remoteConfig.fetchAndActivate();
    return remoteConfig.getString(_serverUrlConfigName);
    // ignore: avoid_catches_without_on_clauses
  } catch (exception) {
    // 取得に失敗してもエラーにしない
  }
  return _defaultServerUrl;
});

Future<Map<String, dynamic>> commonHeader(User user) async {
  try {
    final token = await user.getIdToken();

    final info = await PackageInfo.fromPlatform();

    final appVer = "Amasearch/${info.version}";
    final osVer = await getDeviceInfo();

    return <String, dynamic>{
      "User-Agent": "$appVer $osVer",
      "Authorization": "Bearer $token",
    };
  } on FirebaseAuthException catch (e, stack) {
    await recordError(
      e,
      stack,
      information: [
        "code: ${e.code}",
        e.message ?? "null",
      ],
    );
    throw Exception("通信環境の良いところで再度お試しください");
  }
}
