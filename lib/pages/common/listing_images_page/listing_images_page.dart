import 'dart:io';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:amasearch/widgets/image_select_icon_button.dart';
import 'package:amasearch/widgets/text_icon_button.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reorderables/reorderables.dart';

class ListingImagesPage extends ConsumerStatefulWidget {
  const ListingImagesPage({
    super.key,
    required this.images,
    required this.selectedIndex,
  });
  static const String routeName = "/listing_images";

  static Route<List<String>> route({
    required List<String> images,
    int selectedIndex = 0,
  }) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => ListingImagesPage(
        images: images,
        selectedIndex: selectedIndex,
      ),
    );
  }

  final List<String> images;
  final int selectedIndex;

  @override
  ConsumerState createState() => _ListingImagesPageState();
}

class _ListingImagesPageState extends ConsumerState<ListingImagesPage> {
  late List<String> images;
  late int selectedIndex;

  @override
  void initState() {
    images = widget.images;
    selectedIndex = widget.selectedIndex;
    super.initState();
  }

  static const int _maxImageCount = 6;

  @override
  Widget build(BuildContext context) {
    final windowHeight = MediaQuery.of(context).size.height;

    void onReorder(int oldIndex, int newIndex) {
      setState(() {
        final col = images.removeAt(oldIndex);
        images.insert(newIndex, col);
        if (selectedIndex == oldIndex) {
          selectedIndex = newIndex;
        } else if (oldIndex < selectedIndex && selectedIndex <= newIndex) {
          // 選択中より左側のものを右側に持ってくる場合
          selectedIndex = selectedIndex - 1;
        } else if (oldIndex > selectedIndex && selectedIndex >= newIndex) {
          // 選択中より右側のものを左側に持ってくる場合
          selectedIndex = selectedIndex + 1;
        }
      });
    }

    return WillPopScope(
      onWillPop: () async {
        final ret = await showOkCancelAlertDialog(
          context: context,
          title: "変更を破棄しますか？",
          message: "画像の追加や編集は保存されません。",
          okLabel: "破棄する",
        );
        return ret == OkCancelResult.ok;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("商品画像"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(images);
              },
              child: const Text("完了"),
            ),
          ],
        ),
        body: Column(
          children: [
            const Text("中古出品時に商品画像を設定できます。\n新品出品時には無視されます。"),
            Container(
              height: windowHeight / 2,
              color: Colors.black12,
              child: selectedIndex >= 0
                  ? ExtendedImage.file(File(images[selectedIndex]))
                  : null,
            ),
            const ThemeDivider(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ReorderableRow(
                    onReorder: onReorder,
                    children: [
                      for (var i = 0; i < images.length; i++)
                        GestureDetector(
                          key: ValueKey(images[i]),
                          onTap: () {
                            setState(() {
                              selectedIndex = i;
                            });
                          },
                          child: Container(
                            height: 70,
                            width: 70,
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              border: i == selectedIndex
                                  ? Border.all(color: Colors.blue, width: 2)
                                  : null,
                            ),
                            child: ExtendedImage.file(File(images[i])),
                          ),
                        ),
                    ],
                  ),
                  if (images.length < _maxImageCount)
                    ImageSelectIconButton(
                      size: 70,
                      onSelect: (result) {
                        var img = <String>[
                          ...images,
                          for (var i = 0; i < result.paths.length; i++)
                            if (result.paths[i] != null) result.paths[i]!
                        ];
                        if (img.length > _maxImageCount) {
                          img = img.sublist(0, _maxImageCount);
                        }
                        setState(() {
                          images = img;
                          // 画像をすべて削除したあと再度追加した場合、selectedIndex = -1 になっている
                          if (selectedIndex < 0 && img.isNotEmpty) {
                            selectedIndex = 0;
                          }
                        });
                      },
                    ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextIconButton(
                  icon: const Icon(Icons.auto_fix_high),
                  text: const Text("加工"),
                  onTap: () {},
                ),
                TextIconButton(
                  icon: const Icon(Icons.delete),
                  text: const Text("削除"),
                  onTap: () {
                    setState(() {
                      images = [
                        for (var i = 0; i < images.length; i++)
                          if (i != selectedIndex) images[i]
                      ];
                      if (images.isEmpty) {
                        selectedIndex = -1;
                      } else {
                        selectedIndex = 0;
                      }
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
