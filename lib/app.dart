import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/pages/search/camera_page/camera_page.dart';
import 'package:amasearch/pages/search/search_page/search_page.dart';
import 'package:amasearch/pages/search/search_settings_page/search_settings_page.dart';
import 'package:amasearch/pages/search/word_search_page/word_search_page.dart';
import 'package:amasearch/pages/settings/settings_page/settings_page.dart';
import 'package:amasearch/pages/stocks/stocks_page/stocks_page.dart';
import 'package:amasearch/theme.dart';
import 'package:amasearch/util/util.dart';
import 'package:amasearch/widgets/updater_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyApp extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final observer = useProvider(analyticsObserverProvider);
    final isDarkMode = useProvider(generalSettingsControllerProvider.state
        .select((value) => value.isDarkMode));
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
        return _Unfocus(
          child: child,
        );
      },
      title: 'amzn-item-search',
      theme: isDarkMode ? darkTheme : lightTheme,
      home: Stack(children: [
        const HomePage(),
        Updater(),
      ]),
      routes: {
        SearchSettingsPage.routeName: (context) => const SearchSettingsPage(),
        CameraPage.routeName: (context) => CameraPage(),
      },
      navigatorObservers: [
        observer,
      ],
    );
  }
}

final _currentPageProvider = StateProvider((_) => 0);

class HomePage extends HookWidget {
  const HomePage({Key key}) : super(key: key);

  static const _pages = [
    SearchPage(),
    WordSearchPage(),
    StocksPage(),
    SettingsPage(),
  ];
  static const _names = [
    SearchPage.routeName,
    WordSearchPage.routeName,
    StocksPage.routeName,
    SettingsPage.routeName,
  ];

  @override
  Widget build(BuildContext context) {
    final currentPage = useProvider(_currentPageProvider);
    final observer = useProvider(analyticsObserverProvider);
    return WillPopScope(
      onWillPop: () async {
        return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("終了確認"),
            content: const Text("終了しますか？"),
            actions: [
              FlatButton(
                child: const Text("Cancel"),
                onPressed: () => Navigator.pop(context, false),
              ),
              FlatButton(
                child: const Text("OK"),
                onPressed: () => Navigator.pop(context, true),
              ),
            ],
          ),
        );
      },
      child: Scaffold(
        body: IndexedStack(
          index: currentPage.state,
          children: _pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "コード検索",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.find_in_page),
              label: "ワード検索",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: "仕入れ",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "設定",
            ),
          ],
          currentIndex: currentPage.state,
          onTap: (value) {
            if (currentPage.state != value) {
              currentPage.state = value;
              observer.analytics.setCurrentScreen(screenName: _names[value]);
            }
          },
        ),
      ),
    );
  }
}

class _Unfocus extends HookWidget {
  const _Unfocus({Key key, this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        unfocus();
      },
      child: child,
    );
  }
}
