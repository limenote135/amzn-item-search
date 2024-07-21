import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'makad_page.dart';
import 'pricetar_page.dart';
import 'seller_sket_page.dart';

class ExternalServicesPage extends StatelessWidget {
  const ExternalServicesPage({super.key});

  static const String routeName = "/settings/external_services";

  static Route<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const ExternalServicesPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("価格改定サービス設定"),
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
          title: const Text("プライスター設定"),
          onTap: () {
            Navigator.push(context, PricetarPage.route());
          },
        ),
        ListTile(
          title: const Text("セラースケット設定"),
          onTap: () {
            Navigator.push(context, SellerSketPage.route());
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
