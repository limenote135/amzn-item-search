import 'dart:typed_data';

import 'package:amasearch/models/item.dart';
import 'package:amasearch/widgets/item_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TileImage extends HookWidget {
  const TileImage({Key key, this.onComplete}) : super(key: key);

  final void Function(Future<ByteData> bytes) onComplete;

  @override
  Widget build(BuildContext context) {
    final asinData = useProvider(currentAsinDataProvider);
    final asinCount = useProvider(currentAsinCountProvider);
    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(width: 75),
      child: Column(
        children: [
          ItemImage(
            url: asinData.imageUrl,
            data: asinData.imageData,
            onComplete: onComplete,
          ),
          if (asinCount > 1) const Text("複数"),
        ],
      ),
    );
  }
}
