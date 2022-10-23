import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

Future<String> getDeviceInfo() async {
  if (Platform.isAndroid) {
    final device = await DeviceInfoPlugin().androidInfo;
    return "${Platform.operatingSystem}/Version ${device.version.release} device/${device.model}(${Platform.operatingSystemVersion})";
  } else {
    final device = await DeviceInfoPlugin().iosInfo;
    // 機種名は以下などを参照
    // https://github.com/fieldnotescommunities/ios-device-identifiers
    return "${Platform.operatingSystem}/${Platform.operatingSystemVersion} device/${device.utsname.machine}";
  }
}
