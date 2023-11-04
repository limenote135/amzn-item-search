import 'dart:io';

import 'package:amasearch/models/asin_data.dart';
import 'package:amasearch/models/enums/hazmat_type.dart';
import 'package:amasearch/models/enums/item_condition.dart';
import 'package:amasearch/models/enums/item_sub_condition.dart';
import 'package:amasearch/models/fee_info.dart';
import 'package:amasearch/models/stock_item.dart';
import 'package:amasearch/styles/font.dart';
import 'package:amasearch/util/auth.dart';
import 'package:amasearch/util/formatter.dart';
import 'package:amasearch/util/price_util.dart';
import 'package:amasearch/widgets/floating_action_margin.dart';
import 'package:amasearch/widgets/hazmat_info.dart';
import 'package:amasearch/widgets/item_image.dart';
import 'package:amasearch/widgets/search_buttons.dart';
import 'package:amasearch/widgets/text_line_tile.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StockItemDetail extends ConsumerWidget {
  const StockItemDetail({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(currentStockItemProvider);
    final isPaid = ref.watch(isPaidUserProvider);

    final profitRate = item.sellPrice > 0
        ? (item.profitPerItem / item.sellPrice * 100).round()
        : 0;
    final roi = item.purchasePrice > 0
        ? (item.profitPerItem / item.purchasePrice * 100).round()
        : 0;

    final feeInfo = item.item.prices?.feeInfo ?? const FeeInfo();

    final referralFee =
        calcReferralFee(item.sellPrice, feeInfo, 1); // 消費税はあとで計算
    final referralFeeRate =
        item.sellPrice > 0 ? (referralFee / item.sellPrice * 100).toInt() : 0;
    final categoryFee = feeInfo.variableClosingFee;
    final tax = ((referralFee + categoryFee) * (taxRate - 1)).round();

    final smallProgram = item.isSmallProgram;
    final isUnknownFbaFee = feeInfo.fbaFee == -1;
    var fbaFee = 0;
    if (item.useFba && !isUnknownFbaFee) {
      if (smallProgram) {
        fbaFee = item.smallFee;
      } else {
        fbaFee = feeInfo.fbaFee;
      }
    }
    final totalFeePerItem = referralFee + categoryFee + tax + fbaFee;

    final middleSize = middleFontSize(context);

    return ListView(
      children: [
        if (isPaid && item.item.hazmatType != HazmatType.nonHazmat)
          ProviderScope(
            overrides: [
              currentAsinDataProvider.overrideWithValue(item.item),
            ],
            child: const HazmatInfo(),
          ),
        InkWell(
          onLongPress: () {
            Clipboard.setData(ClipboardData(text: item.item.title)).then((_) {
              ScaffoldMessenger.of(context).removeCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("商品名をコピーしました"),
                ),
              );
            });
          },
          child: ListTile(
            leading: ItemImage(
              url: item.item.imageUrl,
            ),
            title: Text(item.item.title),
          ),
        ),
        const _ItemInfoTile(),
        const ThemeDivider(),
        TextListTile(
          leading: const Text("販売価格"),
          main: Text("${numberFormatter.format(item.sellPrice)} 円"),
        ),
        TextListTile(
          leading: const Text("仕入れ価格"),
          main: Text("${numberFormatter.format(item.purchasePrice)} 円"),
        ),
        TextListTile(
          leading: const Text("出品状態"),
          main: Text(_conditionText(item)),
        ),
        TextListTile(
          leading: const Text("出品個数"),
          main: Text("${item.amount} 個"),
        ),
        TextListTile(
          leading: const Text("その他費用"),
          main: Text("${item.otherCost} 円"),
        ),
        TextListTile(
          leading: const Text("粗利益"),
          main: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(_getProfitText(item)),
              Text("利益率: ${numberFormatter.format(profitRate)} %"),
              Text("ROI: ${numberFormatter.format(roi)} %"),
            ],
          ),
        ),
        ExpansionTile(
          title: TextLine(
            leading: const Text("手数料"),
            main: Text(
              _getFeeText(totalFeePerItem, item.amount, isUnknownFbaFee),
            ),
          ),
          children: [
            const ThemeDivider(),
            ListTile(
              title: Column(
                children: [
                  TextLine(
                    leading: Text("販売手数料($referralFeeRate%)"),
                    main: Text("$referralFee 円"),
                  ),
                  TextLine(
                    leading: const Text("カテゴリ成約料"),
                    main: Text("$categoryFee 円"),
                  ),
                  TextLine(
                    leading: const Text("上記にかかる消費税"),
                    main: Text("$tax 円"),
                  ),
                  TextLine(
                    leading: const Text("FBA手数料"),
                    main: Text(isUnknownFbaFee ? "(不明) 円" : "$fbaFee 円"),
                  ),
                ],
              ),
            ),
          ],
        ),
        TextListTile(
          leading: const Text("損益分岐額"),
          main: Text("${item.breakEven} 円"),
        ),
        InkWell(
          onLongPress: () {
            Clipboard.setData(ClipboardData(text: item.sku)).then((_) {
              ScaffoldMessenger.of(context).removeCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("SKUをコピーしました"),
                ),
              );
            });
          },
          child: TextListTile(
            leading: const Text("SKU"),
            main: Text(item.sku),
          ),
        ),
        TextListTile(
          leading: const Text("仕入れ先"),
          main: Text(item.retailer),
        ),
        TextListTile(
          leading: const Text("仕入れ日"),
          main: Text(DateTime.parse(item.purchaseDate).toLocal().dayFormat()),
        ),
        ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("コンディション説明"),
              Text(
                item.conditionText,
                style: middleSize,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (var i = 0; i < item.images.length; i++)
                  _ListingImage(filePath: item.images[i]),
              ],
            ),
          ),
        ),
        ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("メモ"),
              Text(item.memo),
            ],
          ),
        ),
        const ThemeDivider(),
        ProviderScope(
          overrides: [
            currentItemProvider.overrideWithValue(item.item),
          ],
          child: const SearchButtons(),
        ),
        floatingActionMargin,
      ],
    );
  }

  String _getFeeText(int fee, int amount, bool isUnknownFbaFee) {
    final feePerItem = numberFormatter.format(fee);
    final total = numberFormatter.format(fee * amount);
    if (isUnknownFbaFee) {
      return "$feePerItem 円 * $amount 個 = $total 円 + α";
    } else {
      return "$feePerItem 円 * $amount 個 = $total 円";
    }
  }

  String _getProfitText(StockItem item) {
    final profit = numberFormatter.format(item.profitPerItem);
    final total = numberFormatter.format(item.profitPerItem * item.amount);

    return "$profit 円 * ${item.amount} 個 = $total 円";
  }

  String _conditionText(StockItem item) {
    final condition = item.condition.toDisplayString();
    final subCond = item.subCondition.toDisplayString();
    final condText = item.condition == ItemCondition.newItem
        ? condition
        : "$condition($subCond)";
    final fba = item.useFba ? "FBA 利用" : "自己発送";
    return "$condText $fba";
  }
}

class _ItemInfoTile extends HookConsumerWidget {
  const _ItemInfoTile();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(currentStockItemProvider);
    final smallSize = smallFontSize(context);
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("JAN コード", style: smallSize),
              InkWell(
                onLongPress: () {
                  Clipboard.setData(ClipboardData(text: item.item.jan))
                      .then((_) {
                    ScaffoldMessenger.of(context).removeCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("JAN コードをコピーしました"),
                      ),
                    );
                  });
                },
                child: ListTile(title: Text(item.item.jan)),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("ASIN", style: smallSize),
              InkWell(
                onLongPress: () {
                  Clipboard.setData(ClipboardData(text: item.item.asin))
                      .then((_) {
                    ScaffoldMessenger.of(context).removeCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("ASIN をコピーしました"),
                      ),
                    );
                  });
                },
                child: ListTile(title: Text(item.item.asin)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ListingImage extends StatelessWidget {
  const _ListingImage({required this.filePath});

  final String filePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap: () {
          showDialog<void>(
            context: context,
            builder: (context) {
              return GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: InteractiveViewer(
                  child: SimpleDialog(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: ExtendedImage.file(
                          File(filePath),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: ExtendedImage.file(
          File(filePath),
          height: 50,
          width: 50,
        ),
      ),
    );
  }
}
