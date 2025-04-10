import 'dart:async';
import 'dart:io';

import 'package:amasearch/app.dart';
import 'package:amasearch/models/alert_condition.dart';
import 'package:amasearch/models/asin_data.dart';
import 'package:amasearch/models/constants.dart';
import 'package:amasearch/models/enums/alert_type.dart';
import 'package:amasearch/models/enums/csv_columns.dart';
import 'package:amasearch/models/enums/fulfillment_channel.dart';
import 'package:amasearch/models/enums/hazmat_type.dart';
import 'package:amasearch/models/enums/item_condition.dart';
import 'package:amasearch/models/enums/item_sub_condition.dart';
import 'package:amasearch/models/enums/keepa_show_period.dart';
import 'package:amasearch/models/enums/makad_payment_method.dart';
import 'package:amasearch/models/enums/makad_revise_rule.dart';
import 'package:amasearch/models/enums/pricetar_rule.dart';
import 'package:amasearch/models/enums/pricetar_stopper.dart';
import 'package:amasearch/models/enums/search_type.dart';
import 'package:amasearch/models/enums/seller_type.dart';
import 'package:amasearch/models/enums/sellersket_revise_rule.dart';
import 'package:amasearch/models/enums/shortcut_type.dart';
import 'package:amasearch/models/enums/size_type.dart';
import 'package:amasearch/models/enums/used_sub_condition.dart';
import 'package:amasearch/models/fee_expression.dart';
import 'package:amasearch/models/fee_info.dart';
import 'package:amasearch/models/general_settings.dart';
import 'package:amasearch/models/item_price.dart';
import 'package:amasearch/models/keep_item.dart';
import 'package:amasearch/models/keepa_settings.dart';
import 'package:amasearch/models/makad_settings.dart';
import 'package:amasearch/models/pricetar_settings.dart';
import 'package:amasearch/models/search_item.dart';
import 'package:amasearch/models/search_settings.dart';
import 'package:amasearch/models/sellersket_settings.dart';
import 'package:amasearch/models/stock_item.dart';
import 'package:amasearch/models/word_search_history.dart';
import 'package:amasearch/util/error_report.dart';
import 'package:amasearch/util/random.dart';
import 'package:extended_image/extended_image.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:worker_manager/worker_manager.dart';

import 'firebase_options_dev.dart' as dev;
import 'firebase_options_prod.dart' as prod;

const flavor = String.fromEnvironment('FLAVOR');

bool isProd() {
  return flavor == "prod";
}

// Toggle this for testing Crashlytics in your app locally.
const _kTestingCrashlytics = false;
const _kTestingAnalytics = false;
const _kTestingPerformance = false;

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    final len = randomIntWithRange(4, 7);
    final base = randomString(len);
    final version = "0.${randomIntWithDigit(2)}.${randomIntWithDigit(4)}";

    // Keepa のグラフアクセスを大量に行うとブロックされるので、ランダムで UA を変更する
    // リクエストごとにランダムにしてもよいが、ユーザー単位で固定しておくために
    // グローバルな HttpClient で書き換える
    return super.createHttpClient(context)..userAgent = "ama$base/$version";
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await initFirebase();

  final client = ExtendedNetworkImageProvider.httpClient;
  if (client is HttpClient) {
    // デフォルトでは Dart の UserAgent が入っていて邪魔なので削除する
    client.userAgent = null;
  }
  try {
    await Future.wait<void>([
      initStartupOption(),
      initHive(),
      initRevenueCat(),
      clearDiskCachedImages(duration: const Duration(days: 6)),
      workerManager.init(),
    ]);
    // ignore: avoid_catches_without_on_clauses
  } catch (e, stacktrace) {
    await recordError(
      e,
      stacktrace,
      fatal: true,
      information: const ["Startup failed"],
    );
  }

  // TODO:
  Intl.defaultLocale = 'ja_JP';

  PlatformDispatcher.instance.onError = (error, stack) {
    recordError(error, stack);
    return true;
  };

  runApp(const ProviderScope(child: MyApp()));
}

Future<void> initStartupOption() async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, //縦固定
  ]);
}

Future<void> initFirebase() async {
  await Firebase.initializeApp(
    options: isProd()
        ? prod.DefaultFirebaseOptions.currentPlatform
        : dev.DefaultFirebaseOptions.currentPlatform,
  );

  if (kDebugMode) {
    await Future.wait([
      FirebaseCrashlytics.instance
          .setCrashlyticsCollectionEnabled(_kTestingCrashlytics),
      FirebaseAnalytics.instance
          .setAnalyticsCollectionEnabled(_kTestingAnalytics),
      FirebasePerformance.instance
          .setPerformanceCollectionEnabled(_kTestingPerformance),
    ]);
  }

  await FirebaseRemoteConfig.instance.setConfigSettings(
    RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 15),
      minimumFetchInterval: const Duration(minutes: 15),
    ),
  );

  // Pass all uncaught errors to Crashlytics.
  final Function? originalOnError = FlutterError.onError;
  FlutterError.onError = (FlutterErrorDetails errorDetails) async {
    final exception = errorDetails.exceptionAsString();
    // 商品画像や Keepa 画像の表示に失敗した場合(NotFound や通信エラー)のエラーは送信しない
    if (!exception.startsWith(
          "Bad state: Failed to load https://m.media-amazon.com/images/",
        ) &&
        !exception.contains(
          "Bad state: Failed to load https://graph.keepa.com/",
        ) &&
        !exception.contains(
          "Bad state: Failed to load https://api.keepa.com/graphimage",
        )) {
      await FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
    }
    // Forward to original handler.
    // ignore: avoid_dynamic_calls
    originalOnError!(errorDetails);
  };
}

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive
    ..registerAdapter(SearchItemImplAdapter())
    ..registerAdapter(AsinDataImplAdapter())
    ..registerAdapter(ItemPricesImplAdapter())
    ..registerAdapter(PriceDetailImplAdapter())
    ..registerAdapter(FeeInfoImplAdapter())
    ..registerAdapter(StockItemImplAdapter())
    ..registerAdapter(ListingRestrictionsImplAdapter())
    ..registerAdapter(GeneralSettingsImplAdapter())
    ..registerAdapter(ReadAloudPatternImplAdapter())
    ..registerAdapter(CustomButtonDetailImplAdapter())
    ..registerAdapter(CsvColumnAdapter())
    ..registerAdapter(AlertTypeAdapter())
    ..registerAdapter(AlertConditionImplAdapter())
    ..registerAdapter(AlertConditionSetImplAdapter())
    ..registerAdapter(ShortcutTypeAdapter())
    ..registerAdapter(ShortcutDetailImplAdapter())
    ..registerAdapter(SearchSettingsImplAdapter())
    ..registerAdapter(FulfillmentChannelAdapter())
    ..registerAdapter(ItemConditionAdapter())
    ..registerAdapter(ItemSubConditionAdapter())
    ..registerAdapter(SearchTypeAdapter())
    ..registerAdapter(UsedSubConditionAdapter())
    ..registerAdapter(KeepaSettingsImplAdapter())
    ..registerAdapter(KeepaShowPeriodAdapter())
    ..registerAdapter(PricetarSettingsImplAdapter())
    ..registerAdapter(PricetarRuleAdapter())
    ..registerAdapter(RevisePriceStopperAdapter())
    ..registerAdapter(MakadSettingsImplAdapter())
    ..registerAdapter(MakadReviseRuleAdapter())
    ..registerAdapter(MakadPaymentMethodAdapter())
    ..registerAdapter(SellerSketSettingsImplAdapter())
    ..registerAdapter(SellerSketReviseRuleAdapter())
    ..registerAdapter(WordSearchHistoryImplAdapter())
    ..registerAdapter(KeepItemImplAdapter())
    ..registerAdapter(SizeTypeAdapter())
    ..registerAdapter(HazmatTypeAdapter())
    ..registerAdapter(SellerTypeAdapter())
    ..registerAdapter(FeeExpressionImplAdapter());

  // await deleteBoxes();

  await Future.wait([
    Hive.openBox<SearchItem>(searchItemBoxName),
    Hive.openBox<WordSearchHistory>(wordSearchHistoryBoxName),
    Hive.openBox<StockItem>(stockItemBoxName),
    Hive.openBox<KeepItem>(keepItemBoxName),
    Hive.openBox<dynamic>(settingsBoxName),
  ]);
}

// ignore: unreachable_from_main
Future<void> deleteBoxes() async {
  // await Hive.deleteBoxFromDisk(searchItemBoxName);
  // await Hive.deleteBoxFromDisk(stockItemBoxName);
  await Hive.deleteBoxFromDisk(settingsBoxName);
}

Future<void> initRevenueCat() async {
  if (Platform.isAndroid) {
    await Purchases.configure(
      isProd()
          ? PurchasesConfiguration("goog_kHLAwmYlrkPYuUcTrkIyilEmZtp")
          : PurchasesConfiguration("goog_ZpBjhMgCgarXfMBGnhMHngLslFn"),
    );
  } else {
    await Purchases.configure(
      isProd()
          ? PurchasesConfiguration("appl_TjNyfkblPMFQBFKYdtQAIDibZns")
          : PurchasesConfiguration("appl_ftEbkRAUVtMHQYbtpmVCSAAAQPu"),
    );
  }
}
