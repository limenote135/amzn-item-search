import 'package:amasearch/controllers/purchase_state_notifier.dart';
import 'package:amasearch/pages/settings/donation_page/donation_message_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DonationPage extends StatelessWidget {
  const DonationPage({Key? key}) : super(key: key);
  static const String routeName = "/settings/donation";

  static Route<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const DonationPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("コーヒーをおごる")),
      body: const _Body(),
    );
  }
}

class _Body extends HookConsumerWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final iap = ref.watch(purchaseStateNotifierProvider);
    return iap.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(child: Text("$error")),
      data: (value) {
        final offers = value.offerings.current;
        if (offers == null || offers.availablePackages.isEmpty) {
          return const Center(child: Text("ごちそうできるものがありません"));
        }
        final packages = offers.availablePackages;

        return Column(
          children: [
            const ListTile(
              title: Text("開発者にごちそうすることができます"),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: packages.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    title: Text(packages[i].product.title),
                    subtitle: Text(packages[i].product.description),
                    trailing: Text(packages[i].product.priceString),
                    onTap: () {
                      Navigator.push(
                          context, DonationMessagePage.route(packages[i]));
                    },
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
