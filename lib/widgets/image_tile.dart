import 'dart:io';
import 'dart:typed_data';

import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/models/asin_data.dart';
import 'package:amasearch/models/enums/keepa_show_period.dart';
import 'package:amasearch/models/enums/size_type.dart';
import 'package:amasearch/models/keepa_settings.dart';
import 'package:amasearch/models/search_item.dart';
import 'package:amasearch/styles/font.dart';
import 'package:amasearch/util/auth.dart';
import 'package:amasearch/util/price_util.dart';
import 'package:amasearch/widgets/item_image.dart';
import 'package:amasearch/widgets/keepa_ua_async_widget.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'payment.dart';

const _bigSizeFbaFee = 589;
const _standardFbaFee = 603; // 大型より高いが標準サイズ
const _moreBigSizeFbaFee = 2755;

class TileImage extends HookConsumerWidget {
  const TileImage({super.key, this.onComplete});

  final void Function(ByteData bytes)? onComplete;

  static bool isSmallProduct(AsinData item) {
    if (item.sizeType == SizeType.normal) {
      return false;
    }
    final prices = item.prices;
    if (prices == null) {
      return false;
    }

    final newPrice = prices.newPrices.firstOrNull?.price ?? 0;
    final usedPrice = prices.usedPrices.firstOrNull?.price ?? 0;
    return newPrice < 10000 && usedPrice < 10000;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPaidUser = ref.watch(isPaidUserProvider);
    final asinData = ref.watch(currentAsinDataProvider);
    final asinCount = ref.watch(currentAsinCountProvider);
    final fbaFee = asinData.prices?.feeInfo.fbaFee ?? 0;

    final captionSize = captionFontSizeBlackText(context);

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
          if (isPaidUser && asinData.isHazmat)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 1),
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                color: Colors.red[400],
                child: Text("危険物", style: captionSize),
              ),
            ),
          if (isPaidUser && isSmallProduct(asinData))
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 1),
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                color: Colors.lightGreen[200],
                child:
                    Text(sizeText(asinData.sizeType.name), style: captionSize),
              ),
            ),
          // 589円以上はおおむね大型だが、標準で603円のケースがある
          // サーバーからサイズ情報を返していないバージョンで検索した際には、
          // sizeType は常に normal になってしまうので、
          // その場合はサイズ情報は手数料から計算する
          if (isPaidUser &&
              asinData.sizeType == SizeType.normal &&
              fbaFee >= _bigSizeFbaFee &&
              fbaFee != _standardFbaFee)
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
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 1),
            child: _KeepaImage(),
          ),
        ],
      ),
    );
  }
}

String sizeText(String raw) {
  switch (raw) {
    case "small":
      return "小型軽量";
    case "big":
      return "大型";
    case "moreBig":
      return "特大型";
  }
  return "";
}

class _KeepaImage extends ConsumerWidget {
  const _KeepaImage();

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
    final keepaSettings = ref.watch(
      generalSettingsControllerProvider.select((value) => value.keepaSettings),
    );

    final isPaidUser = ref.watch(isPaidUserProvider);

    if (!isPaidUser) {
      return GestureDetector(
        onTap: () async {
          await showKeepaUnpaidDialog(context: context);
        },
        child: const KeepaLockIcon(),
      );
    }

    return KeepaUaAsyncWidget(
      builder: (ua) => ExtendedImage.network(
        _createKeepaUrl(asinData.asin, keepaSettings),
        // Cookie を入れる場合は以下のようにする
        // headers: <String, String>{
        //   'Cookie': 'key_a=value_a;key_b=value_b',
        // },
        headers: ua != ""
            ? <String, String>{
                "User-Agent": ua,
              }
            : null,
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
                            child: KeepaUaAsyncWidget(
                              builder: (ua) => ExtendedImage.network(
                                _createKeepaUrl(
                                  asinData.asin,
                                  keepaSettings,
                                  width: "600",
                                  height: "300",
                                ),
                                headers: ua != ""
                                    ? <String, String>{
                                        "User-Agent": ua,
                                      }
                                    : null,
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
    );
  }

  Future<void> showKeepaUnpaidDialog({required BuildContext context}) async {
    const title = Text("標準プラン専用機能");
    final content = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text("標準プランではKeepaのグラフが表示されます。\n"
            "プランの内容・変更方法はホームページをご確認ください。"),
        ExtendedImage.asset(
          "assets/keepa_sample.png",
          border: Border.all(),
        ),
      ],
    );

    if (Platform.isIOS) {
      await showCupertinoDialog<void>(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: title,
            content: content,
            actions: [
              CupertinoDialogAction(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
      return;
    } else {
      await showDialog<void>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: title,
            content: content,
            actions: [
              TextButton(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}
