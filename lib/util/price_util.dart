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

// 低価格 FBA 料金が適用されなくなる販売価格のボーダー
// 1000円は適用され、1001円は適用されない
const fbaLowPriceBoarder = 1000;

// 低価格販売手数料が適用されなくなる販売価格のボーダー
// 749円は適用され、750円は適用されない
const referralFeeLowPriceBoarder = 749;
// 低価格販売手数料の最低手数料
const referralFeeLowPriceMin = 30;

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
    if (sellPrice <= fbaLowPriceBoarder && fee.fbaLowPriceFee != 0) {
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
  // 通常の販売手数料
  final normal = (sellPrice * fee.referralFeeRate * taxRate).round();
  var lowPrice = 0;
  if (sellPrice <= referralFeeLowPriceBoarder &&
      fee.referralFeeLowPriceRate != 0) {
    // 低価格販売手数料の適用対象の場合はそちらも計算して安い方を返す
    lowPrice = (sellPrice * fee.referralFeeLowPriceRate * taxRate).round();
    if (lowPrice < referralFeeLowPriceMin * taxRate) {
      lowPrice = (referralFeeLowPriceMin * taxRate).round();
    }
  }
  if (exp == null) {
    if (lowPrice == 0) {
      return normal;
    }
    return lowPrice < normal ? lowPrice : normal;
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
  if (lowPrice == 0) {
    return normal;
  }
  return lowPrice < normal ? lowPrice : normal;
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
    if (sellPrice <= fbaLowPriceBoarder && feeInfo.fbaLowPriceFee != 0) {
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
  /*
  低価格販売手数料設定あり -> 販売
  低価格FBA手数料設定あり -> FBA

  | 販売 | FBA |  749円以下 | 1000円以下 | それ以上
  -------------------------------------------------------
  |  Y  |  Y   |  両適用(1) |  FBAのみ(5)| 標準(8)
  |  Y  |  N   | 販売のみ(2)|  標準(6)   | 標準(8)
  |  N  |  Y   | FBAのみ(3)| FBA のみ(5) | 標準(8)
  |  N  |  N   | 標準(4)   | 標準(7)     | 標準(8)
  */
  if (feeInfo == null) {
    return 0;
  }
  final fbaFee = useFba && feeInfo.fbaFee != -1 ? feeInfo.fbaFee : 0;
  final fbaLowPriceFee = useFba ? feeInfo.fbaLowPriceFee : 0;

  // 標準条件での販売価格
  final sellPrice = _calcTargetPriceFromPurchasePriceImpl(
    purchasePrice: purchasePrice,
    fbaFee: fbaFee,
    referralFeeRate: feeInfo.referralFeeRate,
    closingFee: feeInfo.variableClosingFee,
    rate: rate,
    minProfit: minProfit,
  );

  // 1001円以上の場合は必ず標準条件の価格(8)
  if (sellPrice > fbaLowPriceBoarder) {
    return sellPrice;
  }

  // FBA低価格手数料がないかFBA利用しない場合で、低価格販売手数料もない場合(4)(7)
  if (fbaLowPriceFee == 0 && feeInfo.referralFeeLowPriceRate == 0) {
    return sellPrice;
  }

  // 750円以上の場合、標準条件か FBA 適用かのどちらか
  if (sellPrice > referralFeeLowPriceBoarder) {
    if (fbaLowPriceFee == 0) {
      // FBA を利用しない、または低価格 FBA 手数料の設定が無い場合は標準条件価格(6)(7)
      return sellPrice;
    }
    // FBA 低価格手数料のみを適用
    final lowFbaSellPrice = _calcTargetPriceFromPurchasePriceImpl(
      purchasePrice: purchasePrice,
      // 低価格 FBA 手数料
      fbaFee: fbaLowPriceFee,
      // 通常販売手数料
      referralFeeRate: feeInfo.referralFeeRate,
      closingFee: feeInfo.variableClosingFee,
      rate: rate,
      minProfit: minProfit,
    );
    if (lowFbaSellPrice > referralFeeLowPriceBoarder) {
      // 販売価格が 750円以上なら確定(5)
      return lowFbaSellPrice;
    }
    // 750円未満の場合は低価格販売手数料の適用対象となるのでスルー
  }

  // 750円未満の場合: (1)(2)(3)が対象
  // 低価格販売手数料の設定がある場合
  if (feeInfo.referralFeeLowPriceRate != 0) {
    // FBA 低価格販売料金の設定がある場合は使う(1)
    // なければ通常FBA手数料を使う(2)
    return _calcTargetPriceFromPurchasePriceImpl(
      purchasePrice: purchasePrice,
      fbaFee: fbaLowPriceFee != 0 ? fbaLowPriceFee : fbaFee,
      // 低価格販売手数料
      referralFeeRate: feeInfo.referralFeeLowPriceRate,
      // 低価格販売手数料の場合、最低手数料がある
      minReferralFee: (referralFeeLowPriceMin * taxRate).round(),
      closingFee: feeInfo.variableClosingFee,
      rate: rate,
      minProfit: minProfit,
    );
  }

  // FBA 低価格手数料のみを適用(3)
  return _calcTargetPriceFromPurchasePriceImpl(
    purchasePrice: purchasePrice,
    // 低価格 FBA 手数料
    fbaFee: fbaLowPriceFee,
    // 通常販売手数料
    referralFeeRate: feeInfo.referralFeeRate,
    closingFee: feeInfo.variableClosingFee,
    rate: rate,
    minProfit: minProfit,
  );
}

int _calcTargetPriceFromPurchasePriceImpl({
  required int purchasePrice,
  required int fbaFee,
  required double referralFeeRate,
  int minReferralFee = 0,
  required int closingFee,
  required int rate,
  required int minProfit,
}) {
  // 販売価格 = 購入価格 + 販売手数料 + カテゴリ手数料 + FBA 手数料 + 利益
  // 利益 = max(販売価格 * 利益率, 最低利益額)
  // 販売手数料 = max(販売価格 * 販売手数料率, 最低販売手数料) * 税率
  final price = purchasePrice + closingFee * taxRate + fbaFee;

  // 販売価格 - max(販売価格 * 利益率, 最低利益) =
  //      購入価格 + 販売手数料 + カテゴリ手数料 + FBA 手数料
  // 販売価格 - max(販売価格 * 利益率, 最低利益) - max(販売価格 * 手数料率, 最低販売手数料) * 税率 =
  //      購入価格 + カテゴリ手数料 + FBA 手数料

  // 利益 = 販売価格 * 利益率 && 販売手数料 = 販売価格 * 販売手数料 * 税率 の場合の販売価格を計算
  // 販売価格 * (1 - 利益率 - 販売手数料 * 税率 ) = (購入価格 + カテゴリ手数料 + FBA 手数料)
  final denominator = 1 - referralFeeRate * taxRate - rate / 100;
  final sellPrice1 = denominator > 0 ? (price / denominator).round() : 0;
  final profitTemp = sellPrice1 * rate / 100;

  if (profitTemp > minProfit) {
    // 最低利益額を超えている場合
    if (sellPrice1 * referralFeeRate > minReferralFee) {
      // 最低販売手数料も超えている場合、これを販売価格にする
      return sellPrice1;
    }
    // 最低販売手数料を下回っている場合、最低販売手数料で再計算する
    // 販売価格 - (販売価格 * 利益率) - 最低販売手数料 * 税率 = 購入手数料 + カテゴリ手数料 + FBA 手数料
    final denominator2 = 1 - rate / 100;
    final sellPrice2 = denominator2 > 0
        ? ((price + minReferralFee) / denominator2).round()
        : 0;
    final profitTemp2 = sellPrice2 * rate / 100;
    if (profitTemp2 > minProfit) {
      // 最低販売手数料で再計算しても最低利益額を超えているならこれを販売価格にする
      return sellPrice2;
    }
  }

  // 利益率で最低利益額を超えていない場合、利益額を最低利益額として再計算
  // まずは 販売手数料 = 販売価格 * 販売手数料 * 税率 の場合で計算
  // 販売価格 - 最低利益額 - (販売価格 * 販売手数料率 * 税額) = 購入価格 + カテゴリ手数料 + FBA 手数料
  final denominator3 = 1 - referralFeeRate * taxRate;
  final sellPrice3 =
      denominator3 > 0 ? ((price + minProfit) / denominator3).round() : 0;

  if (sellPrice3 * referralFeeRate > minReferralFee) {
    // 最低販売手数料を超えている場合、これを販売価格にする
    return sellPrice3 > 0 ? sellPrice3 : 0;
  }

  // 最低販売手数料を下回っている場合、最低販売手数料で再計算する
  // 販売価格 - 最低利益額 - 最低販売手数料 * 税率 = 購入価格 + カテゴリ手数料　+ FBA 手数料
  // 販売価格 = 購入価格 + カテゴリ手数料 + FBA 手数料 + 最低利益額 + 最低販売手数料 * 税率
  final sellPrice4 = (price + minProfit + minReferralFee).round();

  return sellPrice4 > 0 ? sellPrice4 : 0;
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
  /*
  低価格販売手数料設定あり -> 販売
  低価格FBA手数料設定あり -> FBA

  | 販売 | FBA |  749円以下 | 1000円以下 | それ以上
  -------------------------------------------------------
  |  Y  |  Y   |  両適用(1) |  FBAのみ(5)| 標準(8)
  |  Y  |  N   | 販売のみ(2)|  標準(6)   | 標準(8)
  |  N  |  Y   | FBAのみ(3)| FBA のみ(5) | 標準(8)
  |  N  |  N   | 標準(4)   | 標準(7)     | 標準(8)
  */
  if (feeInfo == null) {
    return 0;
  }
  final fbaFee = useFba && feeInfo.fbaFee != -1 ? feeInfo.fbaFee : 0;
  final fbaLowPriceFee = useFba ? feeInfo.fbaLowPriceFee : 0;

  final breakEven = _calcBreakEvenImpl(
    purchase: purchase,
    fbaFee: fbaFee,
    // デフォルト金額
    referralFeeRate: feeInfo.referralFeeRate,
    // デフォルト手数料率
    closingFee: feeInfo.variableClosingFee,
    otherCost: otherCost,
    category: category,
    feeInfo: feeInfo,
  );

  if (breakEven > fbaLowPriceBoarder) {
    // 1001円以上なら必ず標準条件の価格(8)
    return breakEven;
  }

  // FBA低価格手数料がないかFBA利用しない場合で、低価格販売手数料もない場合(4)(7)
  if (fbaLowPriceFee == 0 && feeInfo.referralFeeLowPriceRate == 0) {
    return breakEven;
  }

  // 750円以上の場合、標準条件価格か FBA 適用
  if (breakEven > referralFeeLowPriceBoarder) {
    if (fbaLowPriceFee == 0) {
      // FBA を利用しない、または低価格 FBA 手数料の設定が無い場合は標準条件価格(6)(7)
      return breakEven;
    }

    // FBA 低価格手数料を適用
    final lowFbaBreakEven = _calcBreakEvenImpl(
      purchase: purchase,
      // FBA 低価格手数料
      fbaFee: fbaLowPriceFee,
      // デフォルト手数料率
      referralFeeRate: feeInfo.referralFeeRate,
      closingFee: feeInfo.variableClosingFee,
      otherCost: otherCost,
      category: category,
      feeInfo: feeInfo,
    );
    if (lowFbaBreakEven > referralFeeLowPriceBoarder) {
      // 750円以上なら確定(5)
      return lowFbaBreakEven;
    }
    // 750円未満で低価格販売手数料の設定がある場合は適用するのでスルー
  }

  // 750円未満の場合: (1)(2)(3)が対象
  // 低価格販売手数料の設定がある場合
  if (feeInfo.referralFeeLowPriceRate != 0) {
    // FBA 低価格販売料金の設定がある場合は使う(1)
    // なければ通常FBA手数料を使う(2)
    return _calcBreakEvenImpl(
      purchase: purchase,
      // 低価格 FBA 手数料
      fbaFee: fbaLowPriceFee != 0 ? fbaLowPriceFee : fbaFee,
      // 低価格販売手数料
      referralFeeRate: feeInfo.referralFeeLowPriceRate,
      minReferralFee: (referralFeeLowPriceMin * taxRate).round(),
      closingFee: feeInfo.variableClosingFee,
      otherCost: otherCost,
      category: category,
      feeInfo: feeInfo,
    );
  }

  return _calcBreakEvenImpl(
    purchase: purchase,
    // FBA 低価格手数料
    fbaFee: fbaLowPriceFee,
    // デフォルト手数料率
    referralFeeRate: feeInfo.referralFeeRate,
    closingFee: feeInfo.variableClosingFee,
    otherCost: otherCost,
    category: category,
    feeInfo: feeInfo,
  );
}

int _calcBreakEvenImpl({
  required int purchase,
  required int fbaFee,
  required double referralFeeRate,
  int minReferralFee = 0,
  required int closingFee,
  required int otherCost,
  required String category,
  required FeeInfo feeInfo, // 一部カテゴリで手数料が可変の場合のために渡す
}) {
  // SellPrice = PurchasePrice + TotalFee + Profit
  // TotalFee =
  //    (ReferralFee + variableClosingFee) * TaxRate + fbaFee
  // ReferralFee = max(sellPrice * referralFeeRate, minReferralFee) or custom rate
  // SellPrice - ReferralFee =
  //        PurchasePrice + variableClosingFee * taxRate + fbaFee
  final temp = purchase + fbaFee + (closingFee * taxRate) + otherCost;
  final breakEven = (temp / (1 - referralFeeRate * taxRate)).round();
  if (feeInfo.feeExp == null) {
    // 手数料率が均一の場合
    if (breakEven * referralFeeRate > minReferralFee) {
      // 最低販売手数料を超えている場合は確定
      return breakEven;
    }
    // 最低販売手数料を下回っている場合、最低販売手数料で計算する
    return (temp + minReferralFee).round();
  }

  final temp2 = feeInfo.feeExp!.moreThan * (1 - referralFeeRate * taxRate);
  if (temp2 >= temp) {
    // 手数料の切り替わり金額より低い価格になる場合は、固定税率になる
    if (breakEven * referralFeeRate > minReferralFee) {
      // 最低販売手数料を超えている場合は確定
      return breakEven;
    }
    // 最低販売手数料を下回っている場合、最低販売手数料で計算する
    return (temp + minReferralFee).round();
  }

  // これ以降は feeExp がある場合となり、750円未満になることはないはず
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
