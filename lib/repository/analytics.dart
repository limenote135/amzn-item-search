import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final analyticsProvider = Provider((_) => FirebaseAnalytics());

final analyticsObserverProvider = Provider(
    (ref) => FirebaseAnalyticsObserver(analytics: ref.read(analyticsProvider)));
