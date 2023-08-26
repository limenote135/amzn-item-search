import 'package:extended_image/extended_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Faq {
  const Faq({required this.title, this.body, this.bodyText});

  final String title;
  final Widget? body;
  final String? bodyText;
}

const questions = <Faq>[
  Faq(
    title: "有料プランへ変更したい",
    bodyText: "有料プランへの変更はホームページより可能です。\n"
        "ホームページからログインしていただき、プラン変更を選択してください。\n"
        "アプリ内からプランを変更することはできません。",
  ),
  Faq(
    title: "退会したい",
    bodyText: "アカウントを維持したまま、有料プランのみを解約したい場合は"
        "ホームページよりフリープランへ変更いただくと、以降は月額費用は掛かりません。\n"
        "キャンペーンプランからフリープランへ変更した場合、再度キャンペーンプランへ変更することはできないことにご注意ください。\n\n"
        "アカウント自体を削除する場合はアプリの設定画面から \"アカウントの削除\" を選択するか、"
        "ホームページよりログインし、サポートメニューから \"アカウントの削徐\" を選択してください。\n\n"
        "アカウントを削除した場合、契約中のプランは即座にキャンセルされます。"
        "また、同じメールアドレスで再度登録することはできません。",
  ),
  Faq(
    title: "支払い方法を変更したい",
    bodyText: "ホームページよりログインしていただき、登録情報確認メニューより変更が可能です。",
  ),
  Faq(
    title: "Keepa のランキンググラフが表示されない",
    body: _KeepaFaq(),
  ),
  Faq(
    title: "有料プランで契約しているが一部機能が制限されている",
    body: _PlanFaq(),
  ),
  Faq(
    title: "JAN コードではなく ASIN で検索したい",
    bodyText: "ワード検索で ASIN を入力すると、該当 ASIN の情報を検索できます。",
  ),
];

class _KeepaFaq extends StatelessWidget {
  const _KeepaFaq();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "こちらをタップ",
                style: const TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    await launchUrl(
                      Uri.parse(
                        "https://graph.keepa.com/pricehistory.png?asin=B08K41Q79R&domain=co.jp&width=600&salesrank=1&height=300&new=1&used=1&amazon=1&bb=1&fba=1",
                      ),
                      mode: LaunchMode.inAppWebView,
                    );
                  },
              ),
            ],
          ),
        ),
        const Text(
          "していただき、表示された画像にランキンググラフが表示されているかご確認ください。\n\n"
          "ランキンググラフが表示されていない場合、Keepa にログインされていない状態となっているため、"
          "ブラウザから Keepa のページへアクセスいただき、ログインしていただくようにお願いいたします。\n\n"
          "ランキンググラフが表示されている場合、アプリ内の設定画面にある"
          "\"キャッシュを削除\" 選択いただくことで改善する可能性があります。",
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: ExtendedImage.asset("assets/faq/cache.png"),
            ),
          ),
        ),
        const Text(
          "なお、Keepa はログインしたユーザーが同じネットワーク接続をしている限りログイン状態が維持されるようですが、"
          "ネットワーク接続が途切れた場合などは再ログインが必要となります。"
          "こちらは Keepa の仕様のため、アマサーチ側で対処を行うことができません。\n\n"
          "例として、機内モードを一度有効にしたあと無効にした場合や、電波が不安定な場合、"
          "別の Wi-Fi に接続した場合や、一定以上の距離を移動した場合などが該当します。\n\n"
          "このような場合は、再度 Keepa へログインしていただくようにお願いいたします。",
        ),
      ],
    );
  }
}

class _PlanFaq extends StatelessWidget {
  const _PlanFaq();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("現在のプランは設定画面か、ホームページの登録情報確認画面で確認することができます。\n\n"
            "ネットワーク環境が不安定な場合、契約状況の取得ができず、フリープランとして動作する場合があります。\n"
            "その場合は、ネットワーク環境が安定している状態でアプリを再起動してください。"),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: ExtendedImage.asset("assets/faq/plan.png"),
            ),
          ),
        ),
      ],
    );
  }
}
