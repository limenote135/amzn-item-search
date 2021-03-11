import 'package:hive/hive.dart';

import '../constants.dart';

part 'fulfillment_channel.g.dart';

@HiveType(typeId: fulfillmentChannelTypeId)
enum FulfillmentChannel {
  @HiveField(0)
  merchant,
  @HiveField(1)
  amazon,
}

FulfillmentChannel toFulfillmentChannel(String channel) {
  switch (channel) {
    case "Merchant":
      return FulfillmentChannel.merchant;
    case "Amazon":
      return FulfillmentChannel.amazon;
    default:
      throw Exception("Unknown FulfillmentChannel: $channel");
  }
}
