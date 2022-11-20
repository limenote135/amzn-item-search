// ignore_for_file: prefer_adjacent_string_concatenation
import 'package:pub_semver/pub_semver.dart';
import 'package:release_notes_dialog/release_notes_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _prefKey = "release_note_ver";

var releaseNotesVersion = Version(1, 8, 0);
const releaseNotes = <Release>[
  Release("1.8.0", [
    ReleaseSublist(
      name: "更新内容",
      changes: [
        "商品のバリエーション違いを検索できるようになりました",
        "ワード検索時に検索候補が表示されるようになりました",
      ],
    )
  ]),
  Release("1.7.0", [
    ReleaseSublist(
      name: "更新内容",
      changes: [
        "ワード検索の履歴を残すようになりました",
        "価格改定用サービス用のCSVを転送した際、出品済みとしてマークできるようになりました",
      ],
    ),
  ]),
  Release("1.6.2", [
    ReleaseSublist(
      name: "更新内容",
      changes: [
        "v1.6.0 以降、コンディション説明のテンプレートが編集できない不具合を修正",
      ],
    ),
  ]),
  Release("1.6.0", [
    ReleaseSublist(
      name: "更新内容",
      changes: [
        "仕入れ商品を発送方法で検索できるようになりました",
        "仕入れ商品リストをPCに転送する際、プライスター、マカド、セラースケットの一括登録形式を選択できるようになりました。" +
            "設定 -> CSV 設定から詳しい設定を行えます",
      ],
    ),
  ]),
  Release("1.4.0", [
    ReleaseSublist(
      name: "更新内容",
      changes: [
        "仕入れ画面で商品の検索が可能になりました",
        "商品リストを転送する際に指定したもののみ含めるようになりました",
      ],
    )
  ]),
  Release("1.3.3", [
    ReleaseSublist(
      name: "更新内容",
      changes: [
        "仕入れた商品にコンディション説明とその他費用を設定できるようになりました",
        "仕入れ画面で商品状態を変更すると、それに合わせて販売価格を自動変更するようになりました",
      ],
    ),
  ]),
  Release("1.2.2", [
    ReleaseSublist(
      name: "更新内容",
      changes: [
        "Keepaグラフにカート価格とFBA配送を表示できるようになりました",
      ],
    ),
  ]),
  Release("1.2.0", [
    ReleaseSublist(
      name: "更新内容",
      changes: [
        "アプリ内から直接Amazonに出品できるようになりました",
        "カスタムボタンのURLに型番を設定できるようになりました",
        "カスタムボタンの個数が増えました",
        "検索時にAmazonのデータが見つからなかった場合、長押しでコードをコピーできるようにしました",
        "CSVファイルを転送する際にファイル名にタイムスタンプを入れるようにしました",
      ],
    ),
  ]),
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
