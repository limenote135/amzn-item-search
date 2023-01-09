import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

const _imageBox = SizedBox(width: 30);

class ItemImage extends StatelessWidget {
  const ItemImage({super.key, this.url});
  final String? url;

  @override
  Widget build(BuildContext context) {
    if (url?.isEmpty != false) {
      return _imageBox;
    }
    return ExtendedImage.network(
      url!,
      fit: BoxFit.scaleDown,
      loadStateChanged: (state) {
        if (state.extendedImageLoadState != LoadState.completed) {
          return null;
        }
        return state.completedWidget;
      },
    );
  }
}
