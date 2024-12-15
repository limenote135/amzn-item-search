import 'dart:async';
import 'dart:convert';

import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/analytics/properties.dart';
import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/controllers/offer_listings_controller.dart';
import 'package:amasearch/controllers/webview_controller.dart';
import 'package:amasearch/models/offer_listings.dart';
import 'package:amasearch/pages/common/offer_listing_page/offer_listing_with_webview_page.dart';
import 'package:amasearch/repository/amazon.dart';
import 'package:amasearch/styles/font.dart';
import 'package:amasearch/util/auth.dart';
import 'package:amasearch/util/either.dart';
import 'package:amasearch/util/error_report.dart';
import 'package:amasearch/util/formatter.dart';
import 'package:amasearch/util/util.dart';
import 'package:amasearch/widgets/async_value_widget.dart';
import 'package:amasearch/widgets/payment.dart';
import 'package:amasearch/widgets/progress_indicator.dart';
import 'package:amasearch/widgets/strong_container.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:html/dom.dart' as html;
import 'package:html/parser.dart';
import 'package:worker_manager/worker_manager.dart';

import 'offer_chips.dart';
import 'providers.dart';
import 'stock_text.dart';

class OfferListingByScrape extends StatelessWidget {
  const OfferListingByScrape({super.key});

  static const String routeName = "/offer_listing_by_scrape";

  static Route<void> route(OfferListingsParams params) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => ProviderScope(
        overrides: [
          currentOfferListingParamProvider.overrideWithValue(params),
          currentAsinProvider.overrideWithValue(params.asin),
        ],
        child: const OfferListingByScrape(),
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
              return centeredCircularProgressIndicator;
            }
            return const Expanded(child: __Body());
          },
        ),
      ],
    );
  }
}

final currentPageProvider = StateProvider<int>((_) => 1);

class __Body extends ConsumerStatefulWidget {
  const __Body();

  @override
  ConsumerState createState() => ___BodyState();
}

class ___BodyState extends ConsumerState<__Body> {
  late WebviewController webview;
  bool isNextLoading = false;

  @override
  void initState() {
    webview = ref.read(webviewControllerProvider);
    webview.callback = onLoadStop;

    final param = ref.read(currentOfferListingParamProvider);

    final offers = ref.read(asinOfferProvider(param.asin));

    var items = offers.newOffers;
    if (!param.newItem) {
      items = offers.usedOffers;
    }

    if (items.isEmpty) {
      // まだ取得していない場合は1ページ目を取得する
      final u = createUrl(param, 1);
      webview.loadUrl(u);
    } else {}
    super.initState();
  }

  static const _baseUrl =
      "https://www.amazon.co.jp/gp/aod/ajax/ref=dp_aod_ALL_mbc";
  String createUrl(OfferListingsParams params, int page) {
    final reqParam = <String, dynamic>{
      "all": true,
      "primeEligible": params.prime,
      "new": params.newItem,
      "usedLikeNew": params.usedLikeNew,
      "usedVeryGood": params.usedVeryGood,
      "usedGood": params.usedGood,
      "usedAcceptable": params.usedAcceptable,
    };

    final reqParamStr = urlEncode(json.encode(reqParam));
    final query = <String, dynamic>{
      "asin": params.asin,
      "filters": reqParamStr,
      "aodAjaxMain": "aodAjaxMain",
      "pc": "dp",
      "pageno": "$page",
    };

    final queryString = Uri(queryParameters: query).query;
    final u = "$_baseUrl?$queryString";
    return u;
  }

  Future<void> onLoadStop(
    InAppWebViewController controller,
    WebUri? uri,
  ) async {
    if (!mounted || !context.mounted) {
      return;
    }
    final params = ref.read(currentOfferListingParamProvider);

    if (uri == null) {
      return;
    }
    final url = uri.toString();
    if (url.startsWith(_baseUrl)) {
      // 出品一覧ページのロード完了
      final offers = ref.read(asinOfferProvider(params.asin));
      // 1ページ目の読み込みが成功していれば isValid が true になるので、それ以降は無視する
      final doParseTotal =
          params.newItem ? !offers.isValidNew : !offers.isValidUsed;

      final html = await webview.getHtml();
      final (total, cart, offerItems) = await parseFirstPage(
        html!,
        parseCart: !offers.isValidCart,
        parseTotal: doParseTotal,
        asin: params.asin,
      );
      final controller = ref.read(offerListingsControllerProvider.notifier);

      if (params.newItem) {
        controller.addNewOffers(params.asin, total, cart, offerItems);
      } else {
        controller.addUsedOffers(params.asin, total, cart, offerItems);
      }

      if (isNextLoading) {
        setState(() {
          isNextLoading = false;
        });
      }
    }
  }

  Future<(int? total, OfferItem? cart, List<OfferItem> offers)> parseFirstPage(
    String html, {
    bool parseCart = false,
    bool parseTotal = false,
    required String asin,
  }) async {
    final doc = HtmlParser(html).parse();

    final cartFuture = _parseCart(doc, parseCart);
    final totalFuture = _parseTotal(doc, parseTotal);

    final offerItemsFuture = workerManager.execute(
      () {
        return exceptionHandler(
          () => AmazonRepository.parseOfferItems(
            doc.body!,
            AmazonRepository.firstPageOffersSelector,
          ),
        );
      },
    );

    final cart = await cartFuture;
    if (cart.exception != null) {
      await recordError(
        cart.exception,
        cart.stackTrace,
        information: ["asin: $asin"],
      );
      throw cart.exception!;
    }
    final total = await totalFuture;
    if (total.exception != null) {
      await recordError(
        total.exception,
        total.stackTrace,
        information: ["asin: $asin"],
      );
      throw total.exception!;
    }
    final offerItems = await offerItemsFuture;
    if (offerItems.exception != null) {
      await recordError(
        offerItems.exception,
        offerItems.stackTrace,
        information: ["asin: $asin"],
      );
      throw offerItems.exception!;
    }
    return (total.value, cart.value, offerItems.value!);
  }

  Future<Either<OfferItem?>> _parseCart(
    html.Document doc,
    bool parseCart,
  ) async {
    if (!parseCart) {
      return Either<OfferItem?>.ok(null);
    }
    final cartElement = doc.querySelector(AmazonRepository.cartSelector);
    if (cartElement == null) {
      return Either<OfferItem?>.ok(null);
    }
    final f = workerManager.execute(
      () {
        return exceptionHandler(
          () => AmazonRepository.parseCartItem(cartElement),
        );
      },
    );
    return f;
  }

  Future<Either<int?>> _parseTotal(html.Document doc, bool parseTotal) async {
    if (!parseTotal) {
      return Either<int?>.ok(null);
    }
    final totalElement =
        doc.querySelector(AmazonRepository.totalOfferCountSelector);
    final f = workerManager.execute(() {
      return exceptionHandler<int?>(
        () => AmazonRepository.parseTotal(totalElement),
      );
    });
    return f;
  }

  @override
  Widget build(BuildContext context) {
    final doGetStocks = ref.watch(
      generalSettingsControllerProvider.select((value) => value.getStocks),
    );
    final isPaidUser = ref.watch(isPaidUserProvider);

    final param = ref.watch(currentOfferListingParamProvider);
    final offers = ref.watch(asinOfferProvider(param.asin));
    var items = offers.newOffers;
    var total = offers.newTotal;
    var isValid = offers.isValidNew;
    if (!param.newItem) {
      items = offers.usedOffers;
      total = offers.usedTotal;
      isValid = offers.isValidUsed;
    }
    final hasMore = total > items.length;

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
          child: !isValid
              ? centeredCircularProgressIndicator
              : ListView.separated(
                  itemBuilder: (context, indexRaw) {
                    if (indexRaw == 0) {
                      // カート
                      return ProviderScope(
                        overrides: [
                          cartOfferProvider.overrideWithValue(offers.cart),
                        ],
                        child: Column(
                          children: [
                            Text("$total件の出品"),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text("注：送料は含まれません"),
                            ),
                            const CartTileForScraper(),
                          ],
                        ),
                      );
                    }
                    final index = indexRaw - 1;

                    if (index == items.length) {
                      if (isNextLoading) {
                        return const ListTile(
                          title: centeredCircularProgressIndicator,
                        );
                      }
                      return ListTile(
                        title: const Center(child: Text("さらに読み込み")),
                        onTap: () {
                          setState(() {
                            isNextLoading = true;
                            webview.loadUrl(
                              createUrl(param, items.length ~/ 10 + 1),
                            );
                          });
                        },
                      );
                    }

                    return ProviderScope(
                      overrides: [
                        currentAsinProvider.overrideWithValue(param.asin),
                        currentItemIndexProvider.overrideWithValue(index),
                        currentOfferItemProvider
                            .overrideWithValue(items[index]),
                      ],
                      child: const OfferTileForScrape(),
                    );
                  },
                  itemCount: hasMore
                      ? items.length + 2 // カートとさらに読み込み
                      : items.length + 1, // カートを入れるので+1
                  separatorBuilder: (context, index) => const ThemeDivider(),
                ),
        ),
      ],
    );
  }
}

final cartOfferProvider =
    Provider<OfferItem?>((_) => throw UnimplementedError());

class CartTileForScraper extends HookConsumerWidget {
  const CartTileForScraper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final headlineSize = headlineFontSize(context);
    final cart = ref.watch(cartOfferProvider);

    if (cart == null) {
      return const StrongContainer(
        ListTile(
          title: Text("カート無し"),
        ),
      );
    }
    return StrongContainer(
      ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("カート情報"),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      RichText(
                        text: TextSpan(
                          style: headlineSize,
                          children: [
                            TextSpan(
                              text: numberFormatter.format(cart.price),
                              style: strongTextStyle,
                            ),
                            const TextSpan(
                              text: "円",
                              style: blackTextStyle,
                            ),
                          ],
                        ),
                      ),
                      ProviderScope(
                        overrides: [
                          currentSellerIdProvider
                              .overrideWithValue(cart.sellerId),
                        ],
                        child: const StockText(),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ProviderScope(
                    overrides: [
                      currentOfferItemProvider.overrideWithValue(cart),
                    ],
                    child: const OfferChips(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OfferTileForScrape extends ConsumerWidget {
  const OfferTileForScrape({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(currentOfferItemProvider);
    final headlineSize = headlineFontSize(context);

    return ListTile(
      title: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                RichText(
                  text: TextSpan(
                    style: headlineSize,
                    children: [
                      TextSpan(
                        text: numberFormatter.format(item.price),
                        style: strongTextStyle,
                      ),
                      const TextSpan(text: "円"),
                    ],
                  ),
                ),
                ProviderScope(
                  overrides: [
                    currentSellerIdProvider.overrideWithValue(item.sellerId),
                  ],
                  child: const StockText(),
                ),
              ],
            ),
          ),
          Expanded(
            child: ProviderScope(
              overrides: [
                currentOfferItemProvider.overrideWithValue(item),
              ],
              child: const OfferChips(),
            ),
          ),
        ],
      ),
    );
  }
}
