import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/pages/keep/keep_page/keep_page.dart';
import 'package:amasearch/pages/search/search_page/search_page.dart';
import 'package:amasearch/pages/search/word_search_page/word_search_page.dart';
import 'package:amasearch/pages/settings/settings_page/settings_page.dart';
import 'package:amasearch/pages/stocks/stocks_page/stocks_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _currentPageProvider = StateProvider((_) => 0);

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  static const _pages = [
    SearchPage(),
    WordSearchPage(),
    KeepPage(),
    StocksPage(),
    SettingsPage(),
  ];
  static const _names = [
    SearchPage.routeName,
    WordSearchPage.routeName,
    KeepPage.routeName,
    StocksPage.routeName,
    SettingsPage.routeName,
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = ref.watch(_currentPageProvider);
    final observer = ref.watch(analyticsObserverProvider);
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, dynamic result) async {
        if (didPop) {
          return;
        }
        final ret = await showOkCancelAlertDialog(
          context: context,
          title: "終了確認",
          message: "終了しますか？",
          isDestructiveAction: true,
        );
        if (ret == OkCancelResult.ok) {
          await SystemNavigator.pop(animated: true);
        }
      },
      child: Scaffold(
        body: IndexedStack(
          index: currentPage,
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
              icon: Icon(Icons.bookmark),
              label: "キープ",
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
          currentIndex: currentPage,
          onTap: (value) {
            if (currentPage != value) {
              ref.read(_currentPageProvider.notifier).state = value;
              observer.analytics.logScreenView(screenName: _names[value]);
            }
          },
        ),
      ),
    );
  }
}
