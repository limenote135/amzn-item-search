import 'dart:async';

import 'package:amasearch/app.dart';
import 'package:amasearch/models/alert_condition.dart';
import 'package:amasearch/models/constants.dart';
import 'package:amasearch/models/enums/alert_type.dart';
import 'package:amasearch/models/enums/csv_columns.dart';
import 'package:amasearch/models/enums/fulfillment_channel.dart';
import 'package:amasearch/models/enums/item_condition.dart';
import 'package:amasearch/models/enums/item_sub_condition.dart';
import 'package:amasearch/models/enums/keepa_show_period.dart';
import 'package:amasearch/models/enums/search_type.dart';
import 'package:amasearch/models/enums/shortcut_type.dart';
import 'package:amasearch/models/enums/used_sub_condition.dart';
import 'package:amasearch/models/fee_info.dart';
import 'package:amasearch/models/general_settings.dart';
import 'package:amasearch/models/item_price.dart';
import 'package:amasearch/models/keepa_settings.dart';
import 'package:amasearch/models/search_item.dart';
import 'package:amasearch/models/search_settings.dart';
import 'package:amasearch/models/stock_item.dart';
import 'package:amasearch/util/error_report.dart';
import 'package:extended_image/extended_image.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

// Toggle this for testing Crashlytics in your app locally.
const _kTestingCrashlytics = false;
const _kTestingAnalytics = false;
const _kTestingPerformance = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initFirebase();

  try {
    await Future.wait([
      initStartupOption(),
      initHive(),
      clearDiskCachedImages(duration: const Duration(days: 6)),
    ]);
    // ignore: avoid_catches_without_on_clauses
  } catch (e, stacktrace) {
    await recordError(e, stacktrace,
        fatal: true, information: [DiagnosticsNode.message("Startup failed")]);
  }

  // TODO:
  Intl.defaultLocale = 'ja_JP';

  runZonedGuarded(() {
    runApp(const ProviderScope(child: MyApp()));
  }, (error, stackTrace) {
    recordError(error, stackTrace);
  });
}

Future<void> initStartupOption() async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, //縦固定
  ]);
}

Future<void> initFirebase() async {
  await Firebase.initializeApp();

  if (kDebugMode) {
    await Future.wait([
      FirebaseCrashlytics.instance
          .setCrashlyticsCollectionEnabled(_kTestingCrashlytics),
      FirebaseAnalytics().setAnalyticsCollectionEnabled(_kTestingAnalytics),
      FirebasePerformance.instance
          .setPerformanceCollectionEnabled(_kTestingPerformance),
    ]);
  }

  await RemoteConfig.instance.setConfigSettings(
    RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 15),
        minimumFetchInterval: const Duration(minutes: 15)),
  );

  // Pass all uncaught errors to Crashlytics.
  final Function? originalOnError = FlutterError.onError;
  FlutterError.onError = (FlutterErrorDetails errorDetails) async {
    await FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
    // Forward to original handler.
    // ignore: avoid_dynamic_calls
    originalOnError!(errorDetails);
  };
}

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive
    ..registerAdapter(SearchItemAdapter())
    ..registerAdapter(AsinDataAdapter())
    ..registerAdapter(ItemPricesAdapter())
    ..registerAdapter(PriceDetailAdapter())
    ..registerAdapter(FeeInfoAdapter())
    ..registerAdapter(StockItemAdapter())
    ..registerAdapter(GeneralSettingsAdapter())
    ..registerAdapter(ReadAloudPatternAdapter())
    ..registerAdapter(CustomButtonDetailAdapter())
    ..registerAdapter(CsvColumnAdapter())
    ..registerAdapter(AlertTypeAdapter())
    ..registerAdapter(AlertConditionAdapter())
    ..registerAdapter(AlertConditionSetAdapter())
    ..registerAdapter(ShortcutTypeAdapter())
    ..registerAdapter(ShortcutDetailAdapter())
    ..registerAdapter(SearchSettingsAdapter())
    ..registerAdapter(FulfillmentChannelAdapter())
    ..registerAdapter(ItemConditionAdapter())
    ..registerAdapter(ItemSubConditionAdapter())
    ..registerAdapter(SearchTypeAdapter())
    ..registerAdapter(UsedSubConditionAdapter())
    ..registerAdapter(KeepaSettingsAdapter())
    ..registerAdapter(KeepaShowPeriodAdapter());

  // await deleteBoxes();

  await Future.wait([
    Hive.openBox<SearchItem>(searchItemBoxName),
    Hive.openBox<StockItem>(stockItemBoxName),
    Hive.openBox<dynamic>(settingsBoxName),
  ]);
}

Future<void> deleteBoxes() async {
  // await Hive.deleteBoxFromDisk(searchItemBoxName);
  // await Hive.deleteBoxFromDisk(stockItemBoxName);
  await Hive.deleteBoxFromDisk(settingsBoxName);
}
