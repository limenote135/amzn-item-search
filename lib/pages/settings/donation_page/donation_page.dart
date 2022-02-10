import 'package:amasearch/controllers/purchase_state_notifier.dart';
import 'package:amasearch/models/purchase_state.dart';
import 'package:amasearch/pages/settings/donation_page/donation_message_page.dart';
import 'package:amasearch/widgets/async_value_widget.dart';
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
    return AsyncValueWidget<PurchaseState>(
      value: iap,
      errorInfo: const ["Purchase state notifier when"],
      data: (value) {
        final offers = value.offerings.current;
        if (offers == null || offers.availablePackages.isEmpty) {
          return const Center(child: Text("ごちそうできるものがありません"));
        }
        final packages = offers.availablePackages;

        // final offers2 = value.offerings.all["NoAds"];
        // final isAdActive = value.purchaseInfo.entitlements
        //     .all["amasearch_no_ads_sample_entitlement2"]?.isActive;
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
                    title: Text(
                        packages[i].product.title.replaceAll("(amzn-item-search)", "")),
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
            // ListTile(
            //   title: Text("広告の状態: $isAdActive"),
            // ),
            // ListTile(
            //   title: Text(offers2!.availablePackages[0].product.title),
            //   subtitle:
            //       Text(offers2.availablePackages[0].product.description),
            //   trailing:
            //       Text(offers2.availablePackages[0].product.priceString),
            //   onTap: () async {
            //     try {
            //       await EasyLoading.show(status: "処理中...");
            //       final info = await Purchases.purchasePackage(
            //           offers2.availablePackages[0]);
            //
            //       ref.refresh(purchaseStateNotifierProvider.notifier);
            //       print("uid: ${info.originalAppUserId}, "
            //           "purcahseDates: ${info.requestDate}");
            //       print(info);
            //     } catch (e) {
            //       print(e);
            //     } finally {
            //       await EasyLoading.dismiss();
            //     }
            //   },
            // ),
            // ElevatedButton(
            //   onPressed: () async {
            //     await Purchases.restoreTransactions();
            //     ref.refresh(purchaseStateNotifierProvider.notifier);
            //   },
            //   child: const Text("復元"),
            // ),
          ],
        );
      },
    );
  }
}
