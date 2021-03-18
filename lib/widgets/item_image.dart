import 'dart:typed_data';
import 'dart:ui';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class ItemImage extends StatelessWidget {
  const ItemImage({Key? key, this.url, this.data, this.onComplete})
      : super(key: key);
  final String? url;
  final Uint8List? data;
  final void Function(ByteData bytes)? onComplete;

  @override
  Widget build(BuildContext context) {
    if (data == null) {
      print("image from internet");
      return SizedBox(
        width: 75,
        child: ExtendedImage.network(
          url!,
          cache: true,
          fit: BoxFit.scaleDown,
          loadStateChanged: (state) {
            if (state.extendedImageLoadState != LoadState.completed) {
              return null;
            }

            if (state.extendedImageInfo != null) {
              state.extendedImageInfo!.image
                  .toByteData(format: ImageByteFormat.png)
                  .then((value) {
                if (value != null) {
                  onComplete?.call(value);
                }
              });
            }
            return state.completedWidget;
          },
        ),
      );
    }
    print("image from binary");
    return ExtendedImage.memory(
      data!,
      fit: BoxFit.scaleDown,
    );
  }
}
