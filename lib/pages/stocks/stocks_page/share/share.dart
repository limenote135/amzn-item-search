import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';

Future<void> shareImageAndText(GlobalKey globalKey) async {
  final bytes = await exportToImage(globalKey);
  final widgetImageBytes =
      bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
  final applicationDocumentsFile = await saveFile("stock", widgetImageBytes);

  final path = applicationDocumentsFile.path;
  await Share.shareFiles([path], subject: "仕入実績", text: "#アマサーチ");
}

Future<ByteData> exportToImage(GlobalKey globalKey) async {
  final boundary =
      globalKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;

  final image = await boundary!.toImage(
    pixelRatio: 3,
  );
  final byteData = await image.toByteData(
    format: ui.ImageByteFormat.png,
  );
  return byteData!;
}

Future<File> saveFile(String filename, List<int> imageData) async {
  final directory = await getTemporaryDirectory();

  final exportFile = File('${directory.path}/$filename.png');
  if (!exportFile.existsSync()) {
    await exportFile.create(recursive: true);
  }
  final file = await exportFile.writeAsBytes(imageData);
  return file;
}
