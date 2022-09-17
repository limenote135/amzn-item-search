import 'package:amasearch/models/enums/pricetar_stopper.dart';

String createStopperText(RevisePriceStopper type, int value) {
  switch (type) {
    case RevisePriceStopper.nothing:
      return "設定しない";
    case RevisePriceStopper.listingPrice:
      return "出品価格の$value%";
    case RevisePriceStopper.profitValue:
      return "$value円の利益";
    case RevisePriceStopper.profitRate:
      return "$value%の利益率";
  }
}

String createStopperValueInputTitle(RevisePriceStopper type) {
  switch (type) {
    case RevisePriceStopper.nothing:
      // ここにはこないはず
      throw UnimplementedError("$type is not supported");
    case RevisePriceStopper.listingPrice:
      return "出品価格から設定";
    case RevisePriceStopper.profitValue:
      return "利益額から設定";
    case RevisePriceStopper.profitRate:
      return "利益率から設定";
  }
}

String createStopperValueInputMessage(RevisePriceStopper type) {
  switch (type) {
    case RevisePriceStopper.nothing:
      // ここにはこないはず
      throw UnimplementedError("$type is not supported");
    case RevisePriceStopper.listingPrice:
      return "出品価格の何%をストッパーに設定しますか？";
    case RevisePriceStopper.profitValue:
      return "利益額が何円になるようにストッパーを設定しますか？";
    case RevisePriceStopper.profitRate:
      return "利益率が何%になるようにストッパーを設定しますか？";
  }
}
