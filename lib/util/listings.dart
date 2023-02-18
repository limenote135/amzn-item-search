import 'dart:convert';
import 'dart:io';

import 'package:amasearch/models/enums/item_condition.dart';
import 'package:amasearch/models/listing_item.dart';
import 'package:archive/archive_io.dart';
import 'package:dartx/dartx_io.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

const listingsFileVersion = "v1";

Future<File> createListingsFile(List<ListingItem> items) async {
  // JSON に入れる出品画像にはファイル名のみを入れる
  final newItems = items.map(
    (e) {
      if (e.condition == ItemCondition.newItem) {
        // 新品の場合は画像は無視する
        return e.copyWith(images: []);
      }
      // 中古の場合はファイル名を入れる
      return e.copyWith(images: e.images.map((e) => File(e).name).toList());
    },
  ).toList();
  final jsonText = jsonEncode(newItems);

  final tempDir = await getTemporaryDirectory();
  final fileRootDirPath = "${tempDir.absolute.path}/listings";
  final fileDirPath = "$fileRootDirPath/files";
  final rootDir = Directory(fileRootDirPath);
  // 既に存在する場合は削除する
  if (rootDir.existsSync()) {
    rootDir.deleteSync(recursive: true);
  }
  final dir = Directory(fileDirPath);
  await dir.create(recursive: true);

  File("$fileDirPath/listings.json").writeAsStringSync(jsonText);

  final promises = <Future<File>>[];
  for (final item in items) {
    if(item.condition == ItemCondition.newItem) {
      // 新品の場合はコピー不要
      continue;
    }
    for (final img in item.images) {
      final f = File(img);
      final dest = "$fileDirPath/${f.name}";
      promises.add(f.copy(dest));
    }
  }
  await Future.wait(promises);

  final timestamp = DateFormat("yyyyMMdd-HHmmss").format(DateTime.now());
  final encoder = ZipFileEncoder();
  final zipFilePath = "$fileRootDirPath/$timestamp.zip";
  encoder.zipDirectory(dir, filename: zipFilePath);

  return File(zipFilePath);
}
