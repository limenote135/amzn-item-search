import 'dart:typed_data';

import 'package:amasearch/models/search_item.dart';
import 'package:amasearch/styles/font.dart';
import 'package:amasearch/util/price_util.dart';
import 'package:amasearch/widgets/item_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentFbaFeeProvider = ScopedProvider((_) => 0);

const _bigSizeFbaFee = 589;
const _moreBigSizeFbaFee = 3061;

class TileImage extends HookWidget {
  const TileImage({Key? key, this.onComplete}) : super(key: key);

  final void Function(ByteData bytes)? onComplete;

  @override
  Widget build(BuildContext context) {
    final asinData = useProvider(currentAsinDataProvider);
    final asinCount = useProvider(currentAsinCountProvider);
    final fbaFee = useProvider(currentFbaFeeProvider);

    final captionSize = captionSizeBlackText(context);
    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(width: 75),
      child: Column(
        children: [
          ItemImage(
            url: asinData.imageUrl,
            data: asinData.imageData,
            onComplete: onComplete,
          ),
          if (isPremiumPrice(asinData))
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              color: Colors.red[400],
              child: Text("プレ値", style: captionSize),
            ),
          if (fbaFee >= _bigSizeFbaFee)
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              color: Colors.lightGreen[200],
              child: fbaFee >= _moreBigSizeFbaFee
                  ? Text("特大型", style: captionSize)
                  : Text("大型", style: captionSize),
            ),
          if (asinCount > 1)
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              color: Colors.blue[100],
              child: Text("複数", style: captionSize),
            ),
        ],
      ),
    );
  }
}
