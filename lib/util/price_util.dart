import 'package:amasearch/models/asin_data.dart';
import 'package:amasearch/models/enums/fulfillment_channel.dart';
import 'package:amasearch/models/enums/item_sub_condition.dart';
import 'package:amasearch/models/enums/used_sub_condition.dart';
import 'package:amasearch/models/fee_info.dart';
import 'package:amasearch/models/item_price.dart';
import 'package:collection/collection.dart';
import 'package:math_expressions/math_expressions.dart';

import 'formatter.dart';

// 消費税率
const taxRate = 1.1;

// 指定した価格から手数料を引いた粗利益を計算し、文字列として返します。
// FBA 手数料が不明な場合、"-α" として表示します。
String calcProfitText(
  int price,
  FeeInfo? fee, {
  required bool useFba,
}) {
  if (fee == null) {
    return "不明";
  }

  final profit = calcProfit(
    sellPrice: price,
    purchasePrice: 0,
    fee: fee,
    useFba: useFba,
    otherCost: 0,
  );

  if (fee.fbaFee == -1) {
    return "${numberFormatter.format(profit)} - α";
  } else {
    return numberFormatter.format(profit);
  }
}

// 販売価格、仕入れ価格、手数料から利益を計算します。
// FBA 手数料が不明の場合、0円として計算します。
int calcProfit({
  required int sellPrice,
  required int purchasePrice,
  required FeeInfo? fee,
  required bool useFba,
  required int otherCost,
}) {
  if (fee == null) {
    return 0;
  }
  final referralFee = calcReferralFee(sellPrice, fee, taxRate);
  var fbaFee = 0;
  if (useFba && fee.fbaFee != -1) {
    if (sellPrice <= 1000 && fee.fbaLowPriceFee != 0) {
      fbaFee = fee.fbaLowPriceFee;
    } else {
      fbaFee = fee.fbaFee;
    }
  }
  final closingFee = (fee.variableClosingFee * taxRate).round();
  final totalFee = referralFee + closingFee + fbaFee;
  final profit = sellPrice - purchasePrice - totalFee - otherCost;

  return profit;
}

final p = Parser();

int calcReferralFee(int sellPrice, FeeInfo fee, double taxRate) {
  final exp = fee.feeExp;
  final normal = (sellPrice * fee.referralFeeRate * taxRate).round();
  if (exp == null) {
    return normal;
  }
  if (sellPrice > exp.moreThan) {
    final x = Variable('x');
    final cm = ContextModel()..bindVariable(x, Number(sellPrice));
    final expression = p.parse(exp.exp);
    final eval = expression.evaluate(EvaluationType.REAL, cm) as double?;
    if (eval == null) {
      return normal;
    }
    return (eval * taxRate).round();
  }
  return normal;
}

bool isPremiumPrice(AsinData item) {
  if (item.listPrice == 0) {
    return false;
  }
  if (item.prices == null) {
    return false;
  }
  if (item.prices!.newPrices.isNotEmpty) {
    return item.prices!.newPrices.first.price > item.listPrice;
  }
  if (item.prices!.usedPrices.isNotEmpty) {
    return item.prices!.usedPrices.first.price > item.listPrice;
  }
  return false;
}

// 販売価格から目標の利益率を達成する仕入れ額を計算
int calcTargetPriceFromSellPrice({
  required int sellPrice,
  required FeeInfo? feeInfo,
  required int targetRate,
  required int minProfit,
  required bool useFba,
}) {
  if (feeInfo == null) {
    return 0;
  }
  // TaxRate = 1.10
  // ReferralFee = sellPrice * referralFeeRate or custom rate
  // TotalFee =
  //    (ReferralFee + variableClosingFee) * TaxRate + fbaFee
  // Profit = sellPrice * profitRate
  // purchasePrice = sellPrice - TotalFee - Profit
  // purchasePrice = sellPrice
  //      - ((ReferralFee + closingFee) * TaxRate + fbaFee)
  //      - Profit
  // purchasePrice = sellPrice - ReferralFee - closingFee - fbaFee - Profit
  final referralFee = calcReferralFee(sellPrice, feeInfo, taxRate);
  final rawProfit = sellPrice * (targetRate / 100);
  final profit = minProfit > rawProfit ? minProfit : rawProfit;
  final price = sellPrice - referralFee - profit;
  var fbaFee = 0;
  if (useFba && feeInfo.fbaFee != -1) {
    if (sellPrice <= 1000 && feeInfo.fbaLowPriceFee != 0) {
      fbaFee = feeInfo.fbaLowPriceFee;
    } else {
      fbaFee = feeInfo.fbaFee;
    }
  }

  return (price - feeInfo.variableClosingFee * taxRate - fbaFee).round();
}

// 購入価格から目標の利益率を達成できる販売価格を計算する
int calcTargetPriceFromPurchasePrice({
  required int purchasePrice,
  required FeeInfo? feeInfo,
  required int rate,
  required int minProfit,
  required bool useFba,
}) {
  if (feeInfo == null) {
    return 0;
  }
  final sellPrice = _calcTargetPriceFromPurchasePriceImpl(
    purchasePrice: purchasePrice,
    feeInfo: feeInfo,
    useFbaLowPriceFee: false,
    rate: rate,
    minProfit: minProfit,
    useFba: useFba,
  );
  if (sellPrice <= 1000 && feeInfo.fbaLowPriceFee != 0) {
    return _calcTargetPriceFromPurchasePriceImpl(
      purchasePrice: purchasePrice,
      feeInfo: feeInfo,
      useFbaLowPriceFee: true,
      rate: rate,
      minProfit: minProfit,
      useFba: useFba,
    );
  }
  return sellPrice;
}

int _calcTargetPriceFromPurchasePriceImpl({
  required int purchasePrice,
  required FeeInfo feeInfo,
  required bool useFbaLowPriceFee,
  required int rate,
  required int minProfit,
  required bool useFba,
}) {
  // 販売価格 = 購入価格 + 販売手数料 + カテゴリ手数料 + FBA 手数料 + 利益
  // 利益 = max(販売価格 * 利益率, 最低利益額)
  // 販売手数料 = 販売価格 * 販売手数料率 * 税率
  var fbaFee = 0;
  if (useFba && feeInfo.fbaFee != -1) {
    if (useFbaLowPriceFee && feeInfo.fbaLowPriceFee != 0) {
      fbaFee = feeInfo.fbaLowPriceFee;
    } else {
      fbaFee = feeInfo.fbaFee;
    }
  }
  final price = purchasePrice + feeInfo.variableClosingFee * taxRate + fbaFee;

  // 販売価格 - max(販売価格 * 利益率, 最低利益) =
  //      購入価格 + 販売手数料 + カテゴリ手数料 + FBA 手数料
  // 販売価格 - max(販売価格 * 利益率, 最低利益) - (販売価格 * 手数料率 * 税率) =
  //      購入価格 + カテゴリ手数料 + FBA 手数料

  // 利益 = 販売価格 * 利益率の場合の販売価格を計算
  final denominator = 1 - feeInfo.referralFeeRate * taxRate - rate / 100;
  final sellPrice1 = denominator > 0 ? (price / denominator).round() : 0;
  final profitTemp = sellPrice1 * rate / 100;

  if (profitTemp > minProfit) {
    // 最低利益額を超えているならこれを販売価格にする
    return sellPrice1;
  }

  // 利益率では最低利益額を下回るので、利益額を最低利益額として販売価格を計算
  final denominator2 = 1 - feeInfo.referralFeeRate * taxRate;
  final sellPrice2 = ((price + minProfit) / denominator2).round();
  return sellPrice2 > 0 ? sellPrice2 : 0;
}

// 購入価格から、利益が0円になる販売価格を計算
int calcBreakEven({
  required int purchase,
  required bool useFba,
  required FeeInfo? feeInfo,
  required int otherCost,
  required String category,
  int profit = 0,
}) {
  final breakEven = _calcBreakEvenImpl(
    purchase: purchase,
    useFba: useFba,
    useFbaLowPriceFee: false,
    feeInfo: feeInfo,
    otherCost: otherCost,
    category: category,
  );
  if (useFba &&
      0 < breakEven &&
      breakEven <= 1000 &&
      feeInfo != null &&
      feeInfo.fbaLowPriceFee != 0) {
    // 損益分岐が1000円以下の場合、FBA 低価格手数料を使う
    return _calcBreakEvenImpl(
      purchase: purchase,
      useFba: useFba,
      useFbaLowPriceFee: true,
      feeInfo: feeInfo,
      otherCost: otherCost,
      category: category,
    );
  }
  return breakEven;
}

int _calcBreakEvenImpl({
  required int purchase,
  required bool useFba,
  required bool useFbaLowPriceFee,
  required FeeInfo? feeInfo,
  required int otherCost,
  required String category,
  int profit = 0,
}) {
  if (feeInfo == null) {
    return 0;
  }
  // SellPrice = PurchasePrice + TotalFee + Profit
  // TotalFee =
  //    (ReferralFee + variableClosingFee) * TaxRate + fbaFee
  // ReferralFee = sellPrice * referralFeeRate or custom rate
  // SellPrice - ReferralFee =
  //        PurchasePrice + variableClosingFee * taxRate + fbaFee
  var fbaFee = 0;
  if (useFba && feeInfo.fbaFee != -1) {
    if (useFbaLowPriceFee && feeInfo.fbaLowPriceFee != 0) {
      fbaFee = feeInfo.fbaLowPriceFee;
    } else {
      fbaFee = feeInfo.fbaFee;
    }
  }
  final temp = purchase +
      fbaFee +
      (feeInfo.variableClosingFee * taxRate) +
      otherCost +
      profit;
  if (feeInfo.feeExp == null) {
    // 手数料率が均一の場合
    final breakEven = temp / (1 - feeInfo.referralFeeRate * taxRate);
    return breakEven.round();
  }

  final temp2 =
      feeInfo.feeExp!.moreThan * (1 - feeInfo.referralFeeRate * taxRate);
  if (temp2 >= temp) {
    // 手数料の切り替わり金額より低い価格になる場合は、固定税率になる
    final breakEven = temp / (1 - feeInfo.referralFeeRate * taxRate);
    return breakEven.round();
  }

  switch (category) {
    case "ドラッグストア":
      return (temp / (1 - 0.1 * taxRate)).round();
    case "ペット用品":
    case "ベビー&マタニティ":
      return (temp / (1 - 0.15 * taxRate)).round();
    case "ビューティー":
    case "食品・飲料・お酒":
      final referralFee = calcReferralFee(10000, feeInfo, 1); // ここでは消費税は計算しない
      final feeRate = referralFee / 10000.0;
      return (temp / (1 - feeRate * taxRate)).round();
    case "ジュエリー":
      // temp + ReferralFee = SellPrice
      // ReferralFee = SellPrice * 0.06 + 400 + 税 = SellPrice * 0.066 + 440
      // temp + 440 = SellPrice + (1 - 0.066)
      return ((temp + 400 * taxRate) / (1 - 0.06 * taxRate)).round();
    case "ファッション":
      final referralFee = calcReferralFee(10000, feeInfo, 1); // ここでは消費税は計算しない
      if (referralFee == 920) {
        // 服&ファッション小物
        return ((temp + 120 * taxRate) / (1 - 0.08 * taxRate)).round();
      } else if (referralFee == 1050) {
        // シューズ&バッグ
        return ((temp + 450 * taxRate) / (1 - 0.06 * taxRate)).round();
      }
  }

  return 0;
}

int? getLowestPrice(
  ItemPrices? prices, {
  required ItemSubCondition condition,
  required bool priorFba,
}) {
  if (prices == null) {
    return null;
  }
  final targets = condition == ItemSubCondition.newItem
      ? prices.newPrices
      : prices.usedPrices.where(
          (element) =>
              condition.toUsedSubCondition().lessEq(element.subCondition),
        );

  if (targets.isEmpty) {
    return null;
  }

  if (priorFba) {
    // FBA 価格があればそれを使う
    final fbaPrices = targets.firstWhereOrNull(
      (element) => element.channel == FulfillmentChannel.amazon,
    );
    if (fbaPrices != null) {
      return fbaPrices.price;
    }
  }
  return targets.first.price;
}
