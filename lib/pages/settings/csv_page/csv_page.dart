import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'makad_page.dart';
import 'order_page.dart';
import 'pricetar_page.dart';

class PurchaseListPage extends StatelessWidget {
  const PurchaseListPage({super.key});
  static const String routeName = "/settings/csv";

  static Route<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const PurchaseListPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CSV設定"),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends HookConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        ListTile(
          title: const Text("項目の並び順"),
          onTap: () {
            Navigator.push(context, OrderPage.route());
          },
        ),
        ListTile(
          title: const Text("プライスター設定"),
          onTap: () {
            Navigator.push(context, PricetarPage.route());
          },
        ),
        ListTile(
          title: const Text("マカド設定"),
          onTap: () {
            Navigator.push(context, MakadPage.route());
          },
        ),
      ],
    );
  }
}
