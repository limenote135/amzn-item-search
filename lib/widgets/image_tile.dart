import 'dart:typed_data';

import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/models/asin_data.dart';
import 'package:amasearch/models/enums/keepa_show_period.dart';
import 'package:amasearch/models/keepa_settings.dart';
import 'package:amasearch/models/search_item.dart';
import 'package:amasearch/styles/font.dart';
import 'package:amasearch/util/price_util.dart';
import 'package:amasearch/widgets/item_image.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const _bigSizeFbaFee = 589;
const _moreBigSizeFbaFee = 2755;

class TileImage extends HookConsumerWidget {
  const TileImage({super.key, this.onComplete});

  final void Function(ByteData bytes)? onComplete;

  static String _createKeepaUrl(
    String asin,
    KeepaSettings settings, {
    String width = "300",
    String height = "150",
  }) {
    final params = <String>[
      "new=${settings.showNew ? "1" : "0"}",
      "used=${settings.showUsed ? "1" : "0"}",
      "amazon=${settings.showAmazon ? "1" : "0"}",
      "bb=${settings.showBuyBox ? "1" : "0"}",
      "fba=${settings.showFba ? "1" : "0"}",
      "range=${settings.period.toValue()}",
    ];
    return "https://graph.keepa.com/pricehistory.png?"
        "asin=$asin&domain=jp&width=$width&height=$height&salesrank=1&"
        "${params.join("&")}${settings.extraParam}";
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asinData = ref.watch(currentAsinDataProvider);
    final asinCount = ref.watch(currentAsinCountProvider);
    final fbaFee = asinData.prices?.feeInfo.fbaFee ?? 0;

    final captionSize = captionFontSizeBlackText(context);

    final keepaSettings = ref.watch(
      generalSettingsControllerProvider.select((value) => value.keepaSettings),
    );

    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(width: 75),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 1),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 100),
              child: ItemImage(
                url: asinData.imageUrl,
              ),
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
                return GestureDetector(
                  onTap: () {
                    showDialog<void>(
                      context: context,
                      builder: (context) {
                        return GestureDetector(
                          onTap: () {
                            // InteractiveViewer を使うとダイアログが閉じられなくので、
                            // GestureDetector でタップ検知して閉じる
                            Navigator.pop(context);
                          },
                          child: InteractiveViewer(
                            child: SimpleDialog(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    // 画像内はダイアログを閉じないために GestureDetector で上書き
                                  },
                                  child: ExtendedImage.network(
                                    _createKeepaUrl(
                                      asinData.asin,
                                      keepaSettings,
                                      width: "600",
                                      height: "300",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: ExtendedRawImage(
                    image: state.extendedImageInfo?.image,
                    // グラフ部分だけをトリミング
                    sourceRect: const Rect.fromLTWH(45, 20, 100, 100),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
