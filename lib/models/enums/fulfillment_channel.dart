enum FulfillmentChannel {
  merchant,
  amazon,
}

FulfillmentChannel toFulfillmentChannel(String channel) {
  switch(channel) {
    case "Merchant":
      return FulfillmentChannel.merchant;
    case "Amazon":
      return FulfillmentChannel.amazon;
    default:
      throw Exception("Unknown FulfillmentChannel: $channel");
  }
}