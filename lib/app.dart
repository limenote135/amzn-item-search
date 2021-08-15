import 'dart:math';

import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/pages/home_page.dart';
import 'package:amasearch/pages/login_root_page.dart';
import 'package:amasearch/theme.dart';
import 'package:amasearch/util/auth.dart';
import 'package:amasearch/util/util.dart';
import 'package:amasearch/widgets/lifecycle_manager.dart';
import 'package:amasearch/widgets/updater_widget.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final observer = ref.watch(analyticsObserverProvider);
    final isDarkMode = ref.watch(
        generalSettingsControllerProvider.select((value) => value.isDarkMode));
    final authStateChanges = ref.watch(authStateChangesProvider);
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: const [
        Locale("ja", "JP"),
      ],
      builder: (context, child) {
        // 2Column でそれぞれ fontSize 15 で10文字入る程度の文字サイズにする
        // (15 * 10文字 + 左右余白 8 * 2 + 予備4) * 2Column < width
        final media = MediaQuery.of(context);
        final maxScale = (media.size.width - 40) / 300;
        final scale = min(media.textScaleFactor, maxScale);
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: scale),
          child: _Unfocus(
            child: FlutterEasyLoading(child: child),
          ),
        );
      },
      title: 'アマサーチ',
      theme: authStateChanges.maybeWhen(
        data: (value) {
          if (value == null) {
            return lightTheme;
          } else {
            return isDarkMode ? darkTheme : lightTheme;
          }
        },
        orElse: () => lightTheme,
      ),
      home: authStateChanges.when(
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },
        error: (error, stackTrace) {
          FirebaseCrashlytics.instance.recordError(error, stackTrace,
              information: [
                DiagnosticsNode.message("onAuthStateChanges error")
              ]);
          return SafeArea(
            child: Text("$error"),
          );
        },
        data: (value) {
          if (value == null) {
            return const LoginRootPage();
          }
          // TODO: 仮で毎回起動時にセットする
          ref.read(analyticsControllerProvider).setUserId(value.uid);
          return Stack(children: const [
            HomePage(),
            LifecycleManager(callback: UpdateCheckObserver(), child: Updater()),
          ]);
        },
      ),
      navigatorObservers: [
        observer,
      ],
    );
  }
}

class _Unfocus extends StatelessWidget {
  const _Unfocus({Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: unfocus,
      child: child,
    );
  }
}
