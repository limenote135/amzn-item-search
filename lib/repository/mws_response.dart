import 'package:amasearch/models/enums/fulfillment_channel.dart';
import 'package:amasearch/models/enums/item_condition.dart';
import 'package:amasearch/models/enums/item_sub_condition.dart';
import 'package:amasearch/models/item.dart';
import 'package:amasearch/models/item_price.dart';
import 'package:flutter/material.dart';
import 'package:xml/xml.dart';

import './xml_extension.dart';

class GetMatchingProductForIdResponse {
  factory GetMatchingProductForIdResponse(String jan, String raw) {
    final doc = XmlDocument.parse(raw);
    final products = doc.findAllElements("Product");
    if (products.isEmpty) {
      return GetMatchingProductForIdResponse._(jan: jan, items: []);
    }

    final list = <AsinData>[];

    for (final product in products) {
      final title = product.findAllElements("ns2:Title").firstOrDefault()?.text;
      final asin = product.findAllElements("ASIN").firstOrDefault()?.text;
      final image = product.findAllElements("ns2:URL").firstOrDefault()?.text;
      final quantity =
          product.findAllElements("ns2:PackageQuantity").firstOrDefault()?.text;
      final rankEl =
          product.findAllElements("Rank").firstOrDefault()?.text ?? "0";

      final listPrice = product
              .findAllElements("ns2:ListPrice")
              .firstOrDefault()
              ?.findAllElements("ns2:Amount")
              ?.firstOrDefault()
              ?.text ??
          "0";

      final rank = int.tryParse(rankEl) ?? 0;

      final price = int.tryParse(listPrice)?.floor() ?? 0;

      // TODO: 確認
      list.add(AsinData(
        jan: jan ?? " - ",
        asin: asin ?? " - ",
        title: title ?? " - ",
        imageUrl: image ?? " - ",
        rank: rank,
        quantity: quantity ?? " - ",
        listPrice: price,
      ));
    }
    return GetMatchingProductForIdResponse._(jan: jan, items: list);
  }

  GetMatchingProductForIdResponse._({
    @required this.jan,
    @required this.items,
  });

  final String jan;
  final List<AsinData> items;
}

class GetLowestOfferListingsForASINResponse {
  factory GetLowestOfferListingsForASINResponse(String raw) {
    final doc = XmlDocument.parse(raw);
    final offers = doc.findAllElements("LowestOfferListing").toList();

    if (offers.isEmpty) {
      return GetLowestOfferListingsForASINResponse._();
    }

    final prices = <PriceDetail>[];
    for (var i = 0; i < offers.length; i++) {
      final offer = offers[i];

      final cond = offer.findAllElements("ItemCondition").single.text;
      final subCond = offer.findAllElements("ItemSubcondition").single.text;
      final channel = offer.findAllElements("FulfillmentChannel").single.text;

      final landedPrice = offer.findAllElements("LandedPrice");
      final priceEl = landedPrice.single.findAllElements("Amount").single.text;
      final price = double.tryParse(priceEl)?.floor() ?? 0;

      final shippingPrice = offer.findAllElements("Shipping");
      final shipPriceEl =
          shippingPrice.single.findAllElements("Amount").single.text;
      final shipping = double.tryParse(shipPriceEl)?.floor() ?? 0;

      prices.add(PriceDetail(
        itemCondition: toItemCondition(cond),
        subCondition: toItemSubCondition(subCond),
        price: price,
        shipping: shipping,
        channel: toFulfillmentChannel(channel),
        //point:   // TODO:
      ));
    }

    return GetLowestOfferListingsForASINResponse._(
      prices: prices,
    );
  }

  GetLowestOfferListingsForASINResponse._({
    this.prices = const [],
  });

  final List<PriceDetail> prices;
}

class GetMyFeesEstimateResponse {
  factory GetMyFeesEstimateResponse(String raw, int price) {
    final doc = XmlDocument.parse(raw);
    final totalFee = doc.findAllElements("TotalFeesEstimate");

    if (totalFee.isEmpty) {
      return GetMyFeesEstimateResponse._();
    }

    final feeText = totalFee.single.findAllElements("Amount").single.text;
    var feePrice = double.tryParse(feeText)?.floor() ?? 0;

    var referralFee = -1;
    var feeRate = 0.0;
    var variableFee = -1;
    var fbaFee = -1;
    final details = doc
        .findAllElements("FeeDetailList")
        .single
        .findAllElements("FeeDetail");
    for (final detail in details) {
      final type = detail.findElements("FeeType").single.text;
      final amountText = detail
          .findElements("FeeAmount")
          .single
          .findElements("Amount")
          .single
          .text;

      final num = double.tryParse(amountText)?.floor() ?? 0;

      switch (type) {
        case "ReferralFee":
          referralFee = num;
          break;
        case "VariableClosingFee":
          variableFee = num;
          break;
        case "PerItemFee":
          // 小口登録用の費用は除去する
          feePrice = feePrice - num;
          break;
        case "FBAFees":
          fbaFee = num;
          break;
        default:
          break;
      }
    }

    if (price != 0) {
      feeRate = (referralFee / price.toDouble() * 100).round() / 100;
      print("fee rate: $feeRate");
    }

    return GetMyFeesEstimateResponse._(
      totalFee: feePrice,
      referralFee: referralFee,
      referralFeeRate: feeRate,
      variableClosingFee: variableFee,
      fbaFees: fbaFee,
    );
  }

  GetMyFeesEstimateResponse._({
    this.totalFee,
    this.referralFee,
    this.referralFeeRate,
    this.variableClosingFee,
    this.fbaFees,
  });

  final int totalFee;
  final int referralFee; // 販売手数料
  final double referralFeeRate; // 販売手数料税率
  final int variableClosingFee; // カテゴリ成約料
  final int fbaFees; // FBA 手数料
}
