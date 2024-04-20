// ignore_for_file: prefer_adjacent_string_concatenation
import 'package:pub_semver/pub_semver.dart';
import 'package:release_notes_dialog/release_notes_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _prefKey = "release_note_ver";

var releaseNotesVersion = Version(2, 12, 0);
const releaseNotes = <Release>[
  Release(
    title: "2.12.0",
    changes: [
      ChangeGroup(
        title: "更新内容",
        changes: [
          "キープリスト内の商品を検索できるようになりました",
        ],
      ),
    ],
  ),
  Release(
    title: "2.11.0",
    changes: [
      ChangeGroup(
        title: "更新内容",
        changes: [
          "4/1 からのFBA手数料の改定に対応しました",
          "仕入れリスト内の商品を検索する際、大文字小文字を区別しないようになりました",
        ],
      ),
    ],
  ),
  Release(
    title: "2.10.0",
    changes: [
      ChangeGroup(
        title: "更新内容",
        changes: [
          "外部バーコードリーダーを接続した際、JANコード入力欄をタップしなくてもバーコードが読めるようになりました(有料プランのみ)",
        ],
      ),
    ],
  ),
  Release(
    title: "2.9.0",
    changes: [
      ChangeGroup(
        title: "更新内容",
        changes: [
          "コード検索画面で検索結果をスクロールした際、50件ごとにわかるようにしました",
        ],
      ),
    ],
  ),
  Release(
    title: "2.7.0",
    changes: [
      ChangeGroup(
        title: "更新内容",
        changes: [
          "出品者数でアラートを設定できるようになりました",
          "商品詳細画面でどのアラートに一致したか表示するようになりました",
          "仕入れ時に損益分岐価格が表示されるようになりました",
          "価格によって手数料率が変わる商品で正確な手数料が表示されるようになりました",
        ],
      ),
    ],
  ),
  Release(
    title: "2.6.0",
    changes: [
      ChangeGroup(
        title: "更新内容",
        changes: [
          "危険物だった場合により詳細な情報を表示するようになりました",
        ],
      ),
    ],
  ),
  Release(
    title: "2.5.0",
    changes: [
      ChangeGroup(
        title: "更新内容",
        changes: [
          "商品検索時、過去に仕入れたことのある商品の場合はその時の情報を表示するようになりました。",
          "Amazon へ出品登録を行う際、出品済みの商品があれば無視することができるようになりました。",
          "出品者一覧で自分の出品がわかりやすくなりました",
        ],
      ),
    ],
  ),
  Release(
    title: "2.3.0",
    changes: [
      ChangeGroup(
        title: "更新内容",
        changes: [
          "キープリスト内の商品の価格情報を最新のものに更新できるようになりました。",
        ],
      ),
    ],
  ),
  Release(
    title: "2.2.0",
    changes: [
      ChangeGroup(
        title: "更新内容",
        changes: [
          "コードタイプを切り替えなくてもインストアコードが読めるようになりました",
          "仕入れリスト内の商品を仕入れ先で検索できるようになりました",
          "Keepa 画面で2つの期間のグラフを表示できるようになりました",
        ],
      ),
    ],
  ),
  Release(
    title: "2.1.0",
    changes: [
      ChangeGroup(
        title: "更新内容",
        changes: [
          "危険物の場合に表示が行われるようになりました",
          "小型軽量プログラムでの手数料計算に対応しました",
          "上記は有料プラン登録者のみが利用可能です",
        ],
      ),
    ],
  ),
  Release(
    title: "1.10.0",
    changes: [
      ChangeGroup(
        title: "更新内容",
        changes: ["中古出品時に商品画像を指定できるようになりました"],
      ),
    ],
  ),
  Release(
    title: "1.9.0",
    changes: [
      ChangeGroup(
        title: "更新内容",
        changes: ["キープリスト機能を追加しました"],
      ),
    ],
  ),
  Release(
    title: "1.8.0",
    changes: [
      ChangeGroup(
        title: "更新内容",
        changes: [
          "商品のバリエーション違いを検索できるようになりました",
          "ワード検索時に検索候補が表示されるようになりました",
        ],
      ),
    ],
  ),
  Release(
    title: "1.7.0",
    changes: [
      ChangeGroup(
        title: "更新内容",
        changes: [
          "ワード検索の履歴を残すようになりました",
          "価格改定用サービス用のCSVを転送した際、出品済みとしてマークできるようになりました",
        ],
      ),
    ],
  ),
  Release(
    title: "1.6.0",
    changes: [
      ChangeGroup(
        title: "更新内容",
        changes: [
          "仕入れ商品を発送方法で検索できるようになりました",
          "仕入れ商品リストをPCに転送する際、プライスター、マカド、セラースケットの一括登録形式を選択できるようになりました。" +
              "設定 -> CSV 設定から詳しい設定を行えます",
        ],
      ),
    ],
  ),
  Release(
    title: "1.4.0",
    changes: [
      ChangeGroup(
        title: "更新内容",
        changes: [
          "仕入れ画面で商品の検索が可能になりました",
          "商品リストを転送する際に指定したもののみ含めるようになりました",
        ],
      ),
    ],
  ),
  Release(
    title: "1.3.3",
    changes: [
      ChangeGroup(
        title: "更新内容",
        changes: [
          "仕入れた商品にコンディション説明とその他費用を設定できるようになりました",
          "仕入れ画面で商品状態を変更すると、それに合わせて販売価格を自動変更するようになりました",
        ],
      ),
    ],
  ),
  Release(
    title: "1.2.2",
    changes: [
      ChangeGroup(
        title: "更新内容",
        changes: [
          "Keepaグラフにカート価格とFBA配送を表示できるようになりました",
        ],
      ),
    ],
  ),
  Release(
    title: "1.2.0",
    changes: [
      ChangeGroup(
        title: "更新内容",
        changes: [
          "アプリ内から直接Amazonに出品できるようになりました",
          "カスタムボタンのURLに型番を設定できるようになりました",
          "カスタムボタンの個数が増えました",
          "検索時にAmazonのデータが見つからなかった場合、長押しでコードをコピーできるようにしました",
          "CSVファイルを転送する際にファイル名にタイムスタンプを入れるようにしました",
        ],
      ),
    ],
  ),
];

Future<List<Release>?> getReleaseNotes() async {
  final prefs = await SharedPreferences.getInstance();
  final lastReadVersionRaw = prefs.getString(_prefKey);
  if (lastReadVersionRaw == null) {
    // 初回起動時は更新履歴は表示せず、値の更新だけ行う
    await prefs.setString(_prefKey, releaseNotesVersion.toString());
    return null;
  }
  final lastReadVersion = Version.parse(lastReadVersionRaw);

  if (releaseNotesVersion <= lastReadVersion) {
    return null;
  }

  // SharedPreference に表示した ReleaseNotes のバージョンを保存
  await prefs.setString(_prefKey, releaseNotesVersion.toString());
  return releaseNotes;
}
