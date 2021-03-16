import 'package:amasearch/models/offer_listings.dart';
import 'package:amasearch/repository/amazon.dart';
import 'package:amasearch/styles/font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentOfferItemProvider = ScopedProvider<OfferItem>(null);

class OfferChips extends HookWidget {
  const OfferChips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final offer = useProvider(currentOfferItemProvider);
    final chipTheme =
        ChipTheme.of(context).copyWith(labelStyle: blackTextStyle);
    return Wrap(
      spacing: 8,
      children: [
        ChipTheme(
          data: chipTheme,
          child: _shipment(offer),
        ),
        Chip(
          label: Text(offer.condition),
        ),
        if (offer.hasImage)
          ChipTheme(
            data: chipTheme,
            child: Chip(
              label: const Text("写真有"),
              backgroundColor: Colors.lightGreen[200],
            ),
          ),
      ],
    );
  }

  Widget _shipment(OfferItem item) {
    if (item.shopName == AmazonRepository.sellByAmazonName) {
      return Chip(
        label: const Text("Amazon"),
        backgroundColor: Colors.red[200],
      );
    } else if (item.isFba) {
      return Chip(
        label: const Text("FBA"),
        backgroundColor: Colors.blue[200],
      );
    } else {
      return Chip(
        label: const Text("自己発"),
        backgroundColor: Colors.amber[200],
      );
    }
  }
}
