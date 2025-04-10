import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/pages/home_page.dart';
import 'package:amasearch/pages/login_root_page.dart';
import 'package:amasearch/theme.dart';
import 'package:amasearch/util/auth.dart';
import 'package:amasearch/util/util.dart';
import 'package:amasearch/widgets/async_value_widget.dart';
import 'package:amasearch/widgets/lifecycle_manager.dart';
import 'package:amasearch/widgets/updater_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final observer = ref.watch(analyticsObserverProvider);
    final isDarkMode = ref.watch(
      generalSettingsControllerProvider.select((value) => value.isDarkMode),
    );
    final authStateChanges = ref.watch(authStateChangesProvider);
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("ja", "JP"),
      ],
      builder: (context, child) {
        // 2Column でそれぞれ fontSize 15 で10文字入る程度の文字サイズにする
        // (15 * 10文字 + 左右余白 8 * 2 + 予備4) * 2Column < width
        final media = MediaQuery.of(context);
        final maxScale = (media.size.width - 40) / 300;
        return MediaQuery.withClampedTextScaling(
          maxScaleFactor: maxScale,
          child: _Unfocus(
            child: FlutterEasyLoading(child: child),
          ),
        );
      },
      title: 'amzn-item-search',
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
      // TODO: エラー時に SafeArea で囲んでない
      home: AsyncValueWidget<User?>(
        value: authStateChanges,
        errorInfo: const [
          "onAuthStateChanges error",
        ],
        data: (value) {
          if (value == null) {
            return const LoginRootPage();
          }
          // TODO: 仮で毎回起動時にセットする
          ref.read(analyticsControllerProvider).setUserId(value.uid);
          FirebaseCrashlytics.instance.setUserIdentifier(value.uid);
          return const Stack(
            children: [
              HomePage(),
              LifecycleManager(
                callback: UpdateCheckObserver(),
                child: Updater(),
              ),
            ],
          );
        },
      ),
      navigatorObservers: [
        observer,
      ],
    );
  }
}

class _Unfocus extends StatelessWidget {
  const _Unfocus({this.child});

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
