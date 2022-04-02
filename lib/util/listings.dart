import 'dart:convert';
import 'dart:io';

import 'package:amasearch/models/listing_item.dart';
import 'package:archive/archive_io.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

const listingsFileVersion = "v1beta1";

Future<File> createListingsFile(List<ListingItem> items) async {
  final jsonText = jsonEncode(items);

  final tempDir = await getTemporaryDirectory();
  final fileDirPath = "${tempDir.absolute.path}/listings";
  final dir = Directory(fileDirPath);
  // 既に存在する場合は削除する
  if (dir.existsSync()) {
    dir.deleteSync(recursive: true);
  }
  await dir.create();

  File("$fileDirPath/listings.json").writeAsStringSync(jsonText);

  final timestamp = DateFormat("yyyyMMdd-HHmmss").format(DateTime.now());
  final encoder = ZipFileEncoder();
  final zipFilePath = "$fileDirPath/$timestamp.zip";
  encoder.zipDirectory(Directory(fileDirPath), filename: zipFilePath);

  return File(zipFilePath);
}
