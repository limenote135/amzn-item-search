import 'package:amasearch/models/fulfillment_channel.dart';
import 'package:amasearch/models/item.dart';
import 'package:amasearch/models/item_condition.dart';
import 'package:amasearch/models/item_price.dart';
import 'package:amasearch/models/item_sub_condition.dart';
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
      final rankEl = product.findAllElements("Rank").firstOrDefault()?.text;

      final listPrice = product
          .findAllElements("ns2:ListPrice")
          .firstOrDefault()
          ?.findAllElements("ns2:Amount")
          ?.firstOrDefault()
          ?.text;

      var rank = 0;
      try {
        rank = int.parse(rankEl);
      } on Exception catch (_) {
        //TODO: ハンドリング
      }

      var price = 0;
      try {
        price = double.parse(listPrice).floor();
      } on Exception catch (_) {
        // BadNumberFormatException は無視
        // TODO: それ以外は？
      }

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

    var lowestPrice = 0;
    var lowestShipping = 0;
    final prices = <PriceDetail>[];
    for (var i = 0; i < offers.length; i++) {
      final offer = offers[i];

      final cond = offer.findAllElements("ItemCondition").single.text;
      final subCond = offer.findAllElements("ItemSubcondition").single.text;
      final channel = offer.findAllElements("FulfillmentChannel").single.text;

      var price = 0;
      final landedPrice = offer.findAllElements("LandedPrice");
      final priceEl = landedPrice.single.findAllElements("Amount").single.text;
      try {
        price = double.parse(priceEl).floor();
      } on Exception catch (_) {
        // BadNumberFormatException は無視
        // TODO: それ以外は？
      }

      var shipping = 0;
      final shippingPrice = offer.findAllElements("Shipping");
      final shipPriceEl =
          shippingPrice.single.findAllElements("Amount").single.text;
      try {
        shipping = double.parse(shipPriceEl).floor();
      } on Exception catch (_) {
        //TODO: エラーハンドリング
      }

      if (i == 0) {
        lowestPrice = price;
        lowestShipping = shipping;
      }
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
      lowestPrice: lowestPrice,
      shipping: lowestShipping,
      prices: prices,
    );
  }

  GetLowestOfferListingsForASINResponse._({
    this.lowestPrice = 0,
    this.shipping = 0,
    this.prices = const [],
  });

  final int lowestPrice;
  final int shipping;
  final List<PriceDetail> prices;
}

class GetMyFeesEstimateResponse {
  factory GetMyFeesEstimateResponse(String raw, int price) {
    final doc = XmlDocument.parse(raw);
    final totalFee = doc.findAllElements("TotalFeesEstimate");

    if (totalFee.isEmpty) {
      return GetMyFeesEstimateResponse._();
    }

    var feePrice = 0;
    final feeText = totalFee.single.findAllElements("Amount").single.text;
    try {
      feePrice = double.parse(feeText).floor();
    } on Exception catch (_) {
      // TODO: エラーハンドリング
    }

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

      int num;
      try {
        num = double.parse(amountText).floor();
      } on Exception catch (_) {
        //TODO:
      }
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
