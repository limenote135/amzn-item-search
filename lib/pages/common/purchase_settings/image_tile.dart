import 'dart:typed_data';

import 'package:amasearch/models/item.dart';
import 'package:amasearch/widgets/item_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ImageTile extends HookWidget {
  const ImageTile({Key key, this.onComplete}) : super(key: key);

  final void Function(ByteData bytes) onComplete;

  @override
  Widget build(BuildContext context) {
    final item = useProvider(currentAsinDataProvider);
    return ListTile(
      leading: ItemImage(
        url: item.imageUrl,
        data: item.imageData,
        onComplete: onComplete,
      ),
      title: Text(item.title),
    );
  }
}
