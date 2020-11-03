import 'dart:async';

import 'package:amasearch/models/constants.dart';
import 'package:amasearch/models/enums/fulfillment_channel.dart';
import 'package:amasearch/models/enums/item_condition.dart';
import 'package:amasearch/models/enums/item_sub_condition.dart';
import 'package:amasearch/models/enums/search_type.dart';
import 'package:amasearch/models/enums/used_sub_condition.dart';
import 'package:amasearch/models/fee_info.dart';
import 'package:amasearch/models/general_settings.dart';
import 'package:amasearch/models/item.dart';
import 'package:amasearch/models/item_price.dart';
import 'package:amasearch/models/search_settings.dart';
import 'package:amasearch/models/stock_item.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:intl/intl.dart';

import 'app.dart';

// Toggle this for testing Crashlytics in your app locally.
const _kTestingCrashlytics = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([
    initStartupOption(),
    initFirebase(),
    initHive(),
  ]);

  // TODO:
  Intl.defaultLocale = 'ja_JP';

  runZonedGuarded(() {
    runApp(ProviderScope(child: MyApp()));
  }, (error, stackTrace) {
    FirebaseCrashlytics.instance.recordError(error, stackTrace);
  });
}

Future<void> initStartupOption() async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, //縦固定
  ]);
}

Future<void> initFirebase() async {
  await Firebase.initializeApp();

  if (_kTestingCrashlytics) {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  } else {
    await FirebaseCrashlytics.instance
        .setCrashlyticsCollectionEnabled(!kDebugMode);
  }

  // Pass all uncaught errors to Crashlytics.
  final Function originalOnError = FlutterError.onError;
  FlutterError.onError = (FlutterErrorDetails errorDetails) async {
    await FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
    // Forward to original handler.
    originalOnError(errorDetails);
  };
}

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive
    ..registerAdapter(ItemAdapter())
    ..registerAdapter(AsinDataAdapter())
    ..registerAdapter(ItemPricesAdapter())
    ..registerAdapter(PriceDetailAdapter())
    ..registerAdapter(FeeInfoAdapter())
    ..registerAdapter(StockItemAdapter())
    ..registerAdapter(GeneralSettingsAdapter())
    ..registerAdapter(SearchSettingsAdapter())
    ..registerAdapter(FulfillmentChannelAdapter())
    ..registerAdapter(ItemConditionAdapter())
    ..registerAdapter(ItemSubConditionAdapter())
    ..registerAdapter(SearchTypeAdapter())
    ..registerAdapter(UsedSubConditionAdapter());

  // await deleteBoxes();

  await Future.wait([
    Hive.openBox<Item>(searchItemBoxName),
    Hive.openBox<StockItem>(stockItemBoxName),
    Hive.openBox<dynamic>(settingsBoxName),
  ]);
}

Future<void> deleteBoxes() async {
  await Hive.deleteBoxFromDisk(searchItemBoxName);
  await Hive.deleteBoxFromDisk(stockItemBoxName);
  await Hive.deleteBoxFromDisk(settingsBoxName);
}
