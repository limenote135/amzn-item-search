import 'package:amasearch/models/offer_listings.dart';
import 'package:amasearch/widgets/async_value_widget.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'cart_tile.dart';
import 'offer_tile.dart';
import 'stock_text.dart';

final currentOfferListingParamProvider =
    Provider<OfferListingsParams>((_) => throw UnimplementedError());

class OfferListingPage extends StatelessWidget {
  const OfferListingPage({Key? key}) : super(key: key);
  static const String routeName = "/offer_listing";

  static Route<void> route(OfferListingsParams params) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => ProviderScope(
        overrides: [
          currentOfferListingParamProvider.overrideWithValue(params),
        ],
        child: const OfferListingPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("出品一覧(テスト中)"), // TODO: 中古か新品か表示したい
      ),
      body: const _Body(),
    );
  }
}

final currentIndex = Provider<int>((_) => throw UnimplementedError());

class _Body extends HookConsumerWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final param = ref.watch(currentOfferListingParamProvider);
    final offerTotalCountAsyncValue = ref.watch(offerTotalCountProvider(param));
    return AsyncValueWidget<int>(
      value: offerTotalCountAsyncValue,
      errorInfo: [
        "OfferListingsPage._Body.offerTotalCountProvider",
        "Param: ${param.toString()}",
      ],
      data: (value) {
        if (value == 0) {
          return ProviderScope(
            overrides: [
              currentAsinProvider.overrideWithValue(param.asin),
            ],
            child: const CartTile(),
          );
        }
        return ListView.separated(
          itemBuilder: (context, index) {
            return ProviderScope(
              overrides: [
                currentAsinProvider.overrideWithValue(param.asin),
                currentIndex.overrideWithValue(index),
              ],
              child: _selectWidgets(index, value),
            );
          },
          itemCount: value,
          separatorBuilder: (context, index) => const ThemeDivider(),
        );
      },
    );
  }

  Widget _selectWidgets(int index, int total) {
    if (index == 0) {
      return Column(
        children: const [
          CartTile(),
          ThemeDivider(),
          OfferTile(),
        ],
      );
    }
    return const OfferTile();
  }
}
