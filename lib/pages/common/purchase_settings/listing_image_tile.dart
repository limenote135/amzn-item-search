import 'dart:io';

import 'package:amasearch/pages/common/listing_images_page/listing_images_page.dart';
import 'package:amasearch/pages/common/purchase_settings/values.dart';
import 'package:amasearch/widgets/image_select_icon_button.dart';
import 'package:dartx/dartx.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ListingImageTile extends ConsumerWidget {
  const ListingImageTile({super.key});

  static const int _maxImageCount = 6;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ReactiveFormArray<String>(
      formArrayName: listingImagesField,
      builder: (context, formArray, child) {
        final images = formArray.value!.whereNotNull().toList();
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (var i = 0; i < images.length; i++)
                GestureDetector(
                  onTap: () async {
                    // 画像加工ページへ遷移する
                    final result = await Navigator.of(context).push(
                      ListingImagesPage.route(images: images, selectedIndex: i),
                    );
                    if (result == null) {
                      return;
                    }
                    // 数が減る場合、一度 clear しないと正しく反映されない不具合がある
                    formArray
                      ..clear(emitEvent: false, updateParent: false)
                      ..reset(value: result);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ExtendedImage.file(
                      File(images[i]),
                      height: 50,
                      width: 50,
                    ),
                  ),
                ),
              if (images.length < _maxImageCount)
                ImageSelectIconButton(
                  size: 50,
                  onSelect: (result) async {
                    var img = <String>[
                      ...images,
                      for (var i = 0; i < result.paths.length; i++)
                        if (result.paths[i] != null) result.paths[i]!
                    ];
                    if (img.length > _maxImageCount) {
                      img = img.sublist(0, _maxImageCount);
                    }
                    final results = await Navigator.of(context)
                        .push(ListingImagesPage.route(images: img));
                    if (results == null) {
                      return;
                    }
                    // 数が減る場合、一度 clear しないと正しく反映されない不具合がある
                    formArray
                      ..clear(emitEvent: false, updateParent: false)
                      ..reset(value: results);
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}
