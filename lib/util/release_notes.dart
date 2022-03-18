import 'dart:convert';

import 'package:amasearch/models/release_notes.dart';
import 'package:amasearch/util/error_report.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _configName = "release_notes";
const String _prefKey = "release_note_ver";

Future<String?> getReleaseNotes() async {
  final info = await PackageInfo.fromPlatform();
  final currentVersion = Version.parse(info.version);

  final prefs = await SharedPreferences.getInstance();
  final lastReadVersionRaw = prefs.getString(_prefKey);
  final lastReadVersion = Version.parse(lastReadVersionRaw ?? "1.0.0");

  if (currentVersion == lastReadVersion) {
    return null;
  }

  final remoteConfig = FirebaseRemoteConfig.instance;

  try {
    final defaultValue = <String, dynamic>{
      _configName: "",
    };
    await remoteConfig.setDefaults(defaultValue);
    await remoteConfig.fetchAndActivate();
    final rawData = remoteConfig.getString(_configName);
    if (rawData.isEmpty) {
      return null;
    }
    final latestReleaseNotes = json.decode(rawData) as Map<String, dynamic>;

    final notes = ReleaseNotes.fromJson(latestReleaseNotes);
    final latestVersion = Version.parse(notes.version);

    if (currentVersion < latestVersion) {
      // 起動中のバージョンが最新バージョンではない場合
      return null;
    }

    if (lastReadVersionRaw == null) {
      // 初回起動時は更新履歴は表示せず、値の更新だけ行う
      await prefs.setString(_prefKey, latestVersion.toString());
      return null;
    }

    if (lastReadVersion < latestVersion) {
      // SharedPreference に表示した ReleaseNotes のバージョンを保存
      await prefs.setString(_prefKey, latestVersion.toString());
      return notes.text;
    }
    return null;
    // ignore: avoid_catches_without_on_clauses
  } catch (exception, stackTrace) {
    // 取得失敗してもエラーにしない
    await recordError(
      exception,
      stackTrace,
      information: const ["RemoteConfig error"],
    );
  }

  return null;
}
