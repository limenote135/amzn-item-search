import 'dart:io';
import 'dart:ui';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:amasearch/util/error_report.dart';
import 'package:amasearch/widgets/text_icon_button.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_editor/image_editor.dart';
import 'package:path_provider/path_provider.dart';

import 'aspect_ratio.dart';

final _currentImagePathProvider =
    Provider<String>((_) => throw UnimplementedError());

class ImageEditPage extends ConsumerStatefulWidget {
  const ImageEditPage({super.key});

  static const String routeName = "/listing_images/edit";

  static Route<String> route(String path) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => ProviderScope(
        overrides: [
          _currentImagePathProvider.overrideWithValue(path),
        ],
        child: const ImageEditPage(),
      ),
    );
  }

  @override
  ConsumerState createState() => _ImageEditPageState();
}

class _ImageEditPageState extends ConsumerState<ImageEditPage> {
  final GlobalKey<ExtendedImageEditorState> editorKey =
      GlobalKey<ExtendedImageEditorState>();

  AspectRatioItem? _aspectRatio;

  final List<AspectRatioItem> _aspectRatios = <AspectRatioItem>[
    AspectRatioItem(text: 'custom'),
    AspectRatioItem(text: 'original', value: CropAspectRatios.original),
    AspectRatioItem(text: '1:1', value: CropAspectRatios.ratio1_1),
    AspectRatioItem(text: '4:3', value: CropAspectRatios.ratio4_3),
    AspectRatioItem(text: '16:9', value: CropAspectRatios.ratio16_9),
  ];

  @override
  void initState() {
    _aspectRatio = _aspectRatios.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final path = ref.watch(_currentImagePathProvider);
    return WillPopScope(
      onWillPop: () async {
        final ret = await showOkCancelAlertDialog(
          context: context,
          // title: "",
          message: "画像を保存せずに戻りますか？",
          isDestructiveAction: true,
          okLabel: "戻る",
        );
        return ret == OkCancelResult.ok;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("写真の編集"),
          actions: [
            TextButton(
              onPressed: () async {
                final path = await _cropImage();
                if (path != null) {
                  Navigator.of(context).pop(path);
                }
              },
              child: const Text("完了"),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ExtendedImage.file(
                File(path),
                fit: BoxFit.contain,
                mode: ExtendedImageMode.editor,
                extendedImageEditorKey: editorKey,
                cacheRawData: true,
                initEditorConfigHandler: (state) {
                  return EditorConfig(
                    cropAspectRatio: _aspectRatio!.value,
                  );
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: ButtonTheme(
            minWidth: 0,
            padding: EdgeInsets.zero,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextIconButton(
                  icon: const Icon(Icons.crop),
                  text: const Text(
                    "アスペクト比",
                    style: TextStyle(fontSize: 10),
                  ),
                  onTap: () {
                    showDialog<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Column(
                          children: <Widget>[
                            const Expanded(
                              child: SizedBox(),
                            ),
                            SizedBox(
                              height: 100,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                padding: const EdgeInsets.all(20),
                                itemBuilder: (_, int index) {
                                  final item = _aspectRatios[index];
                                  return GestureDetector(
                                    child: AspectRatioWidget(
                                      aspectRatio: item.value,
                                      aspectRatioS: item.text,
                                      isSelected: item == _aspectRatio,
                                    ),
                                    onTap: () {
                                      Navigator.pop(context);
                                      setState(() {
                                        _aspectRatio = item;
                                      });
                                    },
                                  );
                                },
                                itemCount: _aspectRatios.length,
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                TextIconButton(
                  icon: const Icon(Icons.rotate_left),
                  text: const Text(
                    "左回転",
                    style: TextStyle(fontSize: 10),
                  ),
                  onTap: () {
                    editorKey.currentState!.rotate(right: false);
                  },
                ),
                TextIconButton(
                  icon: const Icon(Icons.rotate_right),
                  text: const Text(
                    "右回転",
                    style: TextStyle(fontSize: 10),
                  ),
                  onTap: () {
                    editorKey.currentState!.rotate();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _cropping = false;

  Future<String?> _cropImage() async {
    if (_cropping) {
      return null;
    }
    try {
      _cropping = true;

      final fileData =
          await cropImageDataWithNativeLibrary(state: editorKey.currentState!);

      if (fileData == null) {
        return null;
      }
      final filePath = await ImageSaver.save(fileData);

      return filePath;
      // ignore: avoid_catches_without_on_clauses
    } catch (e, stack) {
      await recordError(
        e,
        stack,
        information: const <String>["Image crop failed"],
      );
      return null;
    } finally {
      _cropping = false;
    }
  }
}

Future<Uint8List?> cropImageDataWithNativeLibrary({
  required ExtendedImageEditorState state,
}) async {
  var cropRect = state.getCropRect()!;
  if (state.widget.extendedImageState.imageProvider is ExtendedResizeImage) {
    final buffer = await ImmutableBuffer.fromUint8List(state.rawImageData);
    final descriptor = await ImageDescriptor.encoded(buffer);

    final widthRatio = descriptor.width / state.image!.width;
    final heightRatio = descriptor.height / state.image!.height;
    cropRect = Rect.fromLTRB(
      cropRect.left * widthRatio,
      cropRect.top * heightRatio,
      cropRect.right * widthRatio,
      cropRect.bottom * heightRatio,
    );
  }

  final action = state.editAction!;

  final rotateAngle = action.rotateAngle.toInt();
  final flipHorizontal = action.flipY;
  final flipVertical = action.flipX;
  final img = state.rawImageData;

  final option = ImageEditorOption();

  if (action.needCrop) {
    option.addOption(ClipOption.fromRect(cropRect));
  }

  if (action.needFlip) {
    option.addOption(
      FlipOption(horizontal: flipHorizontal, vertical: flipVertical),
    );
  }

  if (action.hasRotateAngle) {
    option.addOption(RotateOption(rotateAngle));
  }

  final result = await ImageEditor.editImage(
    image: img,
    imageEditorOption: option,
  );

  return result;
}

class ImageSaver {
  const ImageSaver._();

  static Future<String> save(Uint8List fileData) async {
    final title = '${DateTime.now().millisecondsSinceEpoch}.jpg';
    final dir = await getTemporaryDirectory();
    final myImagePath = "${dir.path}/images/$title";
    final imageFile = File(myImagePath);
    if (!imageFile.existsSync()) {
      await imageFile.create(recursive: true);
    }
    imageFile.writeAsBytesSync(fileData);

    return imageFile.path;
  }
}
