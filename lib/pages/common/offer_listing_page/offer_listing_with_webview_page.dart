import 'dart:async';
import 'dart:math';

import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/analytics/properties.dart';
import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/controllers/webview_controller.dart';
import 'package:amasearch/models/offer_listings.dart';
import 'package:amasearch/util/auth.dart';
import 'package:amasearch/widgets/async_value_widget.dart';
import 'package:amasearch/widgets/payment.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'cart_tile.dart';
import 'offer_tile.dart';
import 'providers.dart';

class OfferListingWithWebviewPage extends StatelessWidget {
  const OfferListingWithWebviewPage({super.key});

  static const String routeName = "/offer_listing_with_webview";

  static Route<void> route(OfferListingsParams params) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => ProviderScope(
        overrides: [
          currentOfferListingParamProvider
              .overrideWithValue(params.copyWith(useWebview: true)),
        ],
        child: const OfferListingWithWebviewPage(),
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

class _Body extends ConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ready = ref.watch(isCookieReadyProvider);
    return Column(
      children: [
        const HeadlessWebview(),
        AsyncValueWidget(
          value: ready,
          data: (data) {
            if (!data) {
              return const Center(child: CircularProgressIndicator());
            }
            return const Expanded(child: __Body());
          },
        ),
      ],
    );
  }
}

class __Body extends HookConsumerWidget {
  const __Body();

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

final initProvider = StateProvider((ref) {
  return false;
});

final isCookieReadyProvider = StreamProvider((ref) async* {
  final state = ref.watch(initProvider);
  yield state;
});

class HeadlessWebview extends ConsumerStatefulWidget {
  const HeadlessWebview({super.key});

  @override
  ConsumerState createState() => _HeadlessWidgetState();
}

class _HeadlessWidgetState extends ConsumerState<HeadlessWebview> {
  late WebviewController webview;

  @override
  void initState() {
    webview = ref.read(webviewControllerProvider);
    final param = ref.read(currentOfferListingParamProvider);
    final initUrl = "https://www.amazon.co.jp/dp/${param.asin}/?aod=1&th=1";
    webview
      ..callback = onLoadStop
      ..loadUrl(initUrl);
    super.initState();
  }

  @override
  void dispose() {
    webview.cancel();
    super.dispose();
  }

  Future<void> onLoadStop(
    InAppWebViewController controller,
    WebUri? uri,
  ) async {
    if (!mounted) {
      return;
    }
    ref.read(initProvider.notifier).state = true;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
