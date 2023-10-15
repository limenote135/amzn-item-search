import 'package:amasearch/models/constants.dart';
import 'package:hive/hive.dart';

part 'seller_type.g.dart';

@HiveType(typeId: sellerTypeTypeId)
enum SellerType {
  @HiveField(0)
  seller,
  @HiveField(1)
  amazon,
  @HiveField(2)
  me,
}

SellerType toSellerType(String type) {
  switch (type) {
    case "":
      return SellerType.seller;
    case "amazon":
      return SellerType.amazon;
    case "me":
      return SellerType.me;
    default:
      throw Exception("Unknown seller type: $type");
  }
}
