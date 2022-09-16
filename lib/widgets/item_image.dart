import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class ItemImage extends StatelessWidget {
  const ItemImage({super.key, this.url});
  final String? url;

  @override
  Widget build(BuildContext context) {
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
