import 'package:amasearch/models/asin_data.dart';
import 'package:amasearch/widgets/item_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ImageTile extends HookConsumerWidget {
  const ImageTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(currentAsinDataProvider);
    return ListTile(
      leading: ItemImage(
        url: item.imageUrl,
      ),
      title: Text(item.title),
    );
  }
}
