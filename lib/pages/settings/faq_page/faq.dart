import 'dart:io';

import 'package:amasearch/styles/font.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Faq {
  const Faq({
    required this.title,
    this.body,
    this.bodyText,
    this.enable = true,
  });

  final bool enable;
  final String title;
  final Widget? body;
  final String? bodyText;
}

final questions = <Faq>[
  const Faq(
    title: "有料プランへ変更したい",
    bodyText: "有料プランへの変更はホームページより可能です。\n"
        "ホームページからログインしていただき、プラン変更を選択してください。\n"
        "アプリ内からプランを変更することはできません。",
  ),
  const Faq(
    title: "退会したい",
    bodyText: "アカウントを維持したまま、有料プランのみを解約したい場合は"
        "ホームページよりフリープランへ変更いただくと、以降は月額費用は掛かりません。\n"
        "キャンペーンプランからフリープランへ変更した場合、再度キャンペーンプランへ変更することはできないことにご注意ください。\n\n"
        "アカウント自体を削除する場合はアプリの設定画面から \"アカウントの削除\" を選択するか、"
        "ホームページよりログインし、サポートメニューから \"アカウントの削徐\" を選択してください。\n\n"
        "アカウントを削除した場合、契約中のプランは即座にキャンセルされます。"
        "また、同じメールアドレスで再度登録することはできません。",
  ),
  const Faq(
    title: "支払い方法を変更したい",
    bodyText: "ホームページよりログインしていただき、登録情報確認メニューより変更が可能です。",
  ),
  const Faq(
    title: "Keepa のランキンググラフが表示されない",
    bodyText: "Keepa 設定画面で API キーの設定をしていただくことで、"
        "トークンの範囲内で必ずランキンググラフが表示されるようになります。\n\n"
        "API キーを利用しない場合、ブラウザ等で Keepa へログインあるいは Keepa ウェブサイト上で"
        "商品の検索等をしていただくことで、以降はアプリ内でもランキンググラフが表示される可能性があります。\n"
        "ただし、モバイル回線を利用している場合、Wi-Fi を切り替えたり、"
        "一定上の距離を移動して別の基地局を利用するようになった場合に再度表示されなくなる可能性があります。\n"
        "(IPアドレスが変わることで同一ユーザーと識別できなくなるため)\n\n"
        "こちらは Keepa 側の仕様となるため、同様の方法を行っている他社アプリでも発生いたします。",
    // body: _KeepaFaq(),
  ),
  Faq(
    enable: Platform.isIOS,
    title: "Keepa 等を開いた際に毎回ログアウトされた状態になる",
    body: const _SafariIssue(),
  ),
  Faq(
    enable: Platform.isIOS,
    title: "バーコードリーダーを接続するとキーボードが表示されなくなる",
    bodyText: "iOS の仕様となっており、メモアプリ等でも同様の挙動となります。\n\n"
        "多くのバーコードリーダーではスキャンボタンを2回押すとキーボードが表示されるようになっております。\n\n"
        "詳しくはバーコードリーダーの説明書をご確認ください。",
  ),
  const Faq(
    title: "有料プランで契約しているが一部機能が制限されている",
    body: _PlanFaq(),
  ),
  const Faq(
    title: "JAN コードではなく ASIN で検索したい",
    bodyText: "ワード検索で ASIN を入力すると、該当 ASIN の情報を検索できます。",
  ),
];

// ignore: unused_element
class _KeepaFaq extends StatelessWidget {
  const _KeepaFaq();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("はじめに", style: strongTextStyle),
              ThemeDivider(),
            ],
          ),
        ),
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
                      mode: LaunchMode.inAppBrowserView,
                    );
                  },
              ),
              const TextSpan(text: "していただき、表示された画像にランキンググラフが表示されているかご確認ください。"),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("グラフが表示されていない場合", style: strongTextStyle),
              ThemeDivider(),
            ],
          ),
        ),
        const Text("ランキンググラフが表示されていない場合、Keepa にログインされていない状態となっています。\n"
            "ブラウザから Keepa のページへアクセスいただき、ログインしてください。"),
        Text.rich(
          TextSpan(
            text: "ログイン後、再度 ",
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
                      mode: LaunchMode.inAppBrowserView,
                    );
                  },
              ),
              const TextSpan(text: " していただき、"),
              const TextSpan(
                text: " グラフが表示されるようになったことをご確認ください。\n",
                style: TextStyle(
                  // fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              const TextSpan(text: "表示されていない場合、アプリ内でも表示されることはありません。"),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("グラフが表示されている場合", style: strongTextStyle),
              ThemeDivider(),
            ],
          ),
        ),
        const Text(
          "アプリ内の設定画面にある \"キャッシュを削除\" をした上でアプリを再起動していただくことで改善する可能性があります。",
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
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
          "こちらは Keepa の仕様のため、amzn-item-search側で対処を行うことができません。\n\n"
          "例として、機内モードを一度有効にしたあと無効にした場合や、電波が不安定な場合、"
          "別の Wi-Fi に接続した場合や、一定以上の距離を移動した場合などが該当します。\n\n"
          "このような場合は、再度 Keepa へログインが必要となります。",
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

class _SafariIssue extends StatelessWidget {
  const _SafariIssue();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "世の中の多くのアプリで低確率で発生している iOS/Safari の不具合のため、Apple へお問い合わせいただく必要があります。\n"
          "暫定的な対処として、設定画面の\"キャッシュの削除\"にてSafariのキャッシュを削除するようにしているため、"
          "これによって改善する可能性がございます。",
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
      ],
    );
  }
}
