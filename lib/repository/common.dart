import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:package_info/package_info.dart';

const _kTestingServer = false;

const serverUrl = !_kTestingServer
    ? "https://amasearch-stg.an.r.appspot.com"
    : "http://192.168.2.201:8080";

Future<Map<String, dynamic>> commonHeader(User user) async {
  final token = await user.getIdToken();

  final info = await PackageInfo.fromPlatform();

  final appVer = "Amasearch/${info.version}";
  final osVer =
      "${Platform.operatingSystem}/${Platform.operatingSystemVersion}";

  return <String, dynamic>{
    "User-Agent": "$appVer $osVer",
    "Authorization": "Bearer $token",
  };
}
