import 'dart:io';

import 'package:amasearch/pages/common/purchase_settings/values.dart';
import 'package:amasearch/util/util.dart';
import 'package:dartx/dartx.dart';
import 'package:extended_image/extended_image.dart';
import 'package:file_picker/file_picker.dart';
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
        final values = formArray.value!.whereNotNull().toList();
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (var i = 0; i < values.length; i++)
                GestureDetector(
                  onTap: () async {
                    // 画像加工ページへ遷移する
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ExtendedImage.file(
                      File(values[i]),
                      height: 50,
                      width: 50,
                    ),
                  ),
                ),
              if (values.length < _maxImageCount)
                _PickImageIcon(
                  onSelect: (result) async {
                    var images = <String>[
                      ...values,
                      for (var i = 0; i < result.paths.length; i++)
                        if (result.paths[i] != null) result.paths[i]!
                    ];
                    if (images.length > _maxImageCount) {
                      images = images.sublist(0, _maxImageCount);
                    }
                    // 数が減る場合、一度 clear しないと正しく反映されない不具合がある
                    formArray
                      ..clear(emitEvent: false, updateParent: false)
                      ..reset(value: images);
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}

class _PickImageIcon extends StatelessWidget {
  const _PickImageIcon({required this.onSelect});

  final void Function(FilePickerResult result) onSelect;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () async {
          final result = await FilePicker.platform.pickFiles(
            type: FileType.image,
            allowMultiple: true,
          );
          if (result == null) {
            return;
          }
          onSelect(result);
        },
        child: Container(
          color: isDark(context) ? Colors.white24 : Colors.black26,
          width: 50,
          height: 50,
          child: const Icon(Icons.image),
        ),
      ),
    );
  }
}
