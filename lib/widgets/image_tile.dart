import 'dart:typed_data';

import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/models/enums/keepa_show_period.dart';
import 'package:amasearch/models/keepa_settings.dart';
import 'package:amasearch/models/search_item.dart';
import 'package:amasearch/styles/font.dart';
import 'package:amasearch/util/price_util.dart';
import 'package:amasearch/widgets/item_image.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentFbaFeeProvider = ScopedProvider((_) => 0);

const _bigSizeFbaFee = 589;
const _moreBigSizeFbaFee = 3061;

class TileImage extends HookWidget {
  const TileImage({Key? key, this.onComplete}) : super(key: key);

  final void Function(ByteData bytes)? onComplete;

  static String _createKeepaUrl(String asin, KeepaSettings settings) {
    final params = <String>[
      "new=${settings.showNew ? "1" : "0"}",
      "used=${settings.showUsed ? "1" : "0"}",
      "amazon=${settings.showAmazon ? "1" : "0"}",
      "range=${settings.period.toValue()}",
    ];
    return "https://graph.keepa.com/pricehistory.png?"
        "asin=$asin&domain=jp&width=300&height=150&salesrank=1&"
        "${params.join("&")}";
  }

  @override
  Widget build(BuildContext context) {
    final asinData = useProvider(currentAsinDataProvider);
    final asinCount = useProvider(currentAsinCountProvider);
    final fbaFee = useProvider(currentFbaFeeProvider);

    final captionSize = captionSizeBlackText(context);

    final keepaSettings = useProvider(generalSettingsControllerProvider
        .select((value) => value.keepaSettings));

    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(width: 75),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 1),
            child: ItemImage(
              url: asinData.imageUrl,
              data: asinData.imageData,
              onComplete: onComplete,
            ),
          ),
          if (isPremiumPrice(asinData))
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 1),
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                color: Colors.red[400],
                child: Text("プレ値", style: captionSize),
              ),
            ),
          if (fbaFee >= _bigSizeFbaFee)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 1),
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                color: Colors.lightGreen[200],
                child: fbaFee >= _moreBigSizeFbaFee
                    ? Text("特大型", style: captionSize)
                    : Text("大型", style: captionSize),
              ),
            ),
          if (asinCount > 1)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 1),
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                color: Colors.blue[100],
                child: Text("複数", style: captionSize),
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 1),
            child: ExtendedImage.network(
              _createKeepaUrl(asinData.asin, keepaSettings),
              // Cookie を入れる場合は以下のようにする
              // headers: <String, String>{
              //   'Cookie': 'key_a=value_a;key_b=value_b',
              // },
              loadStateChanged: (state) {
                if (state.extendedImageLoadState != LoadState.completed) {
                  return null;
                }
                return ExtendedRawImage(
                  image: state.extendedImageInfo?.image,
                  // グラフ部分だけをトリミング
                  sourceRect: const Rect.fromLTWH(45, 20, 80, 110),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
