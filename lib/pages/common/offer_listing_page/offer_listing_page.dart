import 'dart:async';
import 'dart:math';

import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/analytics/properties.dart';
import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/models/offer_listings.dart';
import 'package:amasearch/util/auth.dart';
import 'package:amasearch/util/error_report.dart';
import 'package:amasearch/widgets/async_value_widget.dart';
import 'package:amasearch/widgets/payment.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'cart_tile.dart';
import 'offer_listing_with_webview_page.dart';
import 'offer_tile.dart';
import 'providers.dart';

class OfferListingPage extends StatelessWidget {
  const OfferListingPage({super.key});

  static const String routeName = "/offer_listing";

  static const _configNameUseWebviewOffer = "use_webview_offer";

  static Future<void> goToOfferListingPage(
    BuildContext context,
    OfferListingsParams params,
  ) async {
    final remoteConfig = FirebaseRemoteConfig.instance;

    try {
      final defaultValues = <String, dynamic>{
        _configNameUseWebviewOffer: false,
      };
      await remoteConfig.setDefaults(defaultValues);
      await remoteConfig.fetchAndActivate();
      const useWebviewOffer =
          false; //remoteConfig.getBool(_configNameUseWebviewOffer);

      if (useWebviewOffer) {
        await Navigator.of(context)
            .push(OfferListingWithWebviewPage.route(params));
      } else {
        await Navigator.of(context).push(_route(params));
      }
      // ignore: avoid_catches_without_on_clauses
    } catch (e, st) {
      await recordError(
        e,
        st,
        information: const ["RemoteConfig error"],
      );
      await Navigator.of(context).push(_route(params));
    }
  }

  static Route<void> _route(OfferListingsParams params) {
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

class _Body extends HookConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final doGetStocks = ref.watch(
      generalSettingsControllerProvider.select((value) => value.getStocks),
    );
    final param = ref.watch(currentOfferListingParamProvider);
    final offerTotalCountAsyncValue = ref.watch(offerTotalCountProvider(param));
    final isPaidUser = ref.watch(isPaidUserProvider);
    final maxItem = useState(10);

    return Column(
      children: [
        SwitchListTile(
          title: const WithLockIconIfNotPaid(child: Text("在庫数を取得(β)")),
          subtitle: const Text("表示が重くなります"),
          value: doGetStocks,
          onChanged: (value) async {
            if (value && !isPaidUser) {
              await showUnpaidDialog(context);
              return;
            }
            ref
                .read(generalSettingsControllerProvider.notifier)
                .update(getStocks: value);
            unawaited(
              ref
                  .read(analyticsControllerProvider)
                  .setUserProp(getStocksPropName, value.toString()),
            );
          },
        ),
        Flexible(
          child: AsyncValueWidget<int>(
            value: offerTotalCountAsyncValue,
            errorInfo: [
              "OfferListingsPage._Body.offerTotalCountProvider",
              "Param: $param",
            ],
            data: (value) {
              if (value == 0) {
                return const CartTile();
              }

              final hasMore = value > maxItem.value;
              final showItemCount = min(value, maxItem.value);

              return ListView.separated(
                itemBuilder: (context, index) {
                  if (index == showItemCount) {
                    return ListTile(
                      title: const Center(child: Text("さらに読み込み")),
                      onTap: () {
                        final newMax = maxItem.value + 10;
                        maxItem.value = min(value, newMax);
                      },
                    );
                  }
                  return ProviderScope(
                    overrides: [
                      currentAsinProvider.overrideWithValue(param.asin),
                      currentItemIndexProvider.overrideWithValue(index),
                    ],
                    child: _selectWidgets(index, value),
                  );
                },
                itemCount: hasMore ? showItemCount + 1 : showItemCount,
                separatorBuilder: (context, index) => const ThemeDivider(),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _selectWidgets(int index, int total) {
    if (index == 0) {
      return Column(
        children: [
          Text("$total件の出品"),
          const CartTile(),
          const ThemeDivider(),
          const OfferTile(),
        ],
      );
    }
    return const OfferTile();
  }
}
