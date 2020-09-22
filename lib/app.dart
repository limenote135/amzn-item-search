import 'package:ama_search/pages/search/camera_page/camera_page.dart';
import 'package:ama_search/pages/search/search_page/search_page.dart';
import 'package:ama_search/pages/search/search_settings_page/search_settings_page.dart';
import 'package:ama_search/pages/settings/settings_page/settings_page.dart';
import 'package:ama_search/pages/stocks/stocks_page/stocks_page.dart';
import 'package:ama_search/util/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/all.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
      theme: ThemeData(
        primarySwatch: Colors.green,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
        dividerTheme: const DividerThemeData(
          color: Colors.black,
        ),
      ),
      home: const HomePage(),
      routes: {
        SearchSettingsPage.routeName: (context) => const SearchSettingsPage(),
        CameraPage.routeName: (context) => CameraPage(),
      },
    );
  }
}

final _currentPageProvider = StateProvider((_) => 0);

class HomePage extends HookWidget {
  const HomePage({Key key}) : super(key: key);

  static const _pages = [
    SearchPage(),
    StocksPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final currentPage = useProvider(_currentPageProvider);
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
              icon: Icon(Icons.find_in_page),
              title: Text("検索"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              title: Text("仕入れ"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text("設定"),
            ),
          ],
          currentIndex: currentPage.state,
          onTap: (value) {
            if (currentPage.state != value) {
              currentPage.state = value;
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
