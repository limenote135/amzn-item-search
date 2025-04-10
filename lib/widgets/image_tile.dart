import 'dart:typed_data';

import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/models/asin_data.dart';
import 'package:amasearch/models/enums/hazmat_type.dart';
import 'package:amasearch/models/enums/size_type.dart';
import 'package:amasearch/models/search_item.dart';
import 'package:amasearch/styles/font.dart';
import 'package:amasearch/util/auth.dart';
import 'package:amasearch/util/keepa.dart';
import 'package:amasearch/util/price_util.dart';
import 'package:amasearch/widgets/custom_dialog.dart';
import 'package:amasearch/widgets/item_image.dart';
import 'package:amasearch/widgets/keepa_ua_async_widget.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'payment.dart';

const _bigSizeFbaFee = 589;
const _standardFbaFee = 603; // 大型より高いが標準サイズ
const _moreBigSizeFbaFee = 2755;

class TileImage extends HookConsumerWidget {
  const TileImage({super.key, this.onComplete});

  final void Function(ByteData bytes)? onComplete;

  static bool shouldShowSize(AsinData item) {
    switch (item.sizeType) {
      case SizeType.normal:
      case SizeType.small:
        return false;
      case SizeType.big:
      case SizeType.moreBig:
        return true;
    }
  }

  static Color? getHazmatColor(AsinData item) {
    switch (item.hazmatType) {
      case HazmatType.nonHazmat: // ここで nonHazmat の場合、isHazmat=true
      case HazmatType.hazmat:
        return Colors.red[400];
      case HazmatType.sds:
      case HazmatType.battery:
      case HazmatType.warn:
      case HazmatType.unknown:
      case HazmatType.qualification:
        return Colors.yellow[400];
    }
  }

  static String getHazmatText(AsinData item) {
    switch (item.hazmatType) {
      case HazmatType.nonHazmat:
        if (item.isHazmat) {
          return "危険物";
        }
        return "";
      case HazmatType.sds:
        return "要SDS";
      case HazmatType.battery:
        return "充電池";
      case HazmatType.warn:
      case HazmatType.unknown:
        return "納品注意";
      case HazmatType.hazmat:
        return "危険物";
      case HazmatType.qualification:
        return "要資格";
    }
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
          if (isPaidUser &&
              (asinData.isHazmat ||
                  asinData.hazmatType != HazmatType.nonHazmat))
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 1),
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                color: getHazmatColor(asinData),
                child: Text(getHazmatText(asinData), style: captionSize),
              ),
            ),
          if (isPaidUser && shouldShowSize(asinData))
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
      return "小型"; // small は shouldShowSize が false なので表示されない
    case "big":
      return "大型";
    case "moreBig":
      return "特大型";
  }
  return "";
}

class _KeepaImage extends ConsumerWidget {
  const _KeepaImage();

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

    final key = keepaSettings.useApiKey ? keepaSettings.apiKey : "";
    return KeepaUaAsyncWidget(
      builder: (ua) => ExtendedImage.network(
        createKeepaUrl(asinData.asin, keepaSettings, key: key),
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
                                createKeepaUrl(
                                  asinData.asin,
                                  keepaSettings,
                                  width: "600",
                                  height: "300",
                                  key: key,
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
    await showCustomOkDialog(context: context, title: title, content: content);
  }
}
