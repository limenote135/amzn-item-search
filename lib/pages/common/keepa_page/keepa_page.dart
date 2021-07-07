import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/models/enums/keepa_show_period.dart';
import 'package:amasearch/util/util.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentAsinProvider = Provider<String>((_) => throw UnimplementedError());

class KeepaPage extends ConsumerWidget {
  const KeepaPage({Key? key}) : super(key: key);
  static const String routeName = "/keepa";

  static Route<void> route(String asin) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => ProviderScope(
        overrides: [
          currentAsinProvider.overrideWithValue(asin),
        ],
        child: const KeepaPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Keepa"),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () async {
              await clearDiskCachedImages();
              ref
                  .read(generalSettingsControllerProvider.notifier)
                  .changeKeepaExtraParam();
            },
          ),
        ],
      ),
      body: const _Body(),
    );
  }
}

class _Body extends HookConsumerWidget {
  const _Body({Key? key}) : super(key: key);

  static List<bool> _createRangeState(KeepaShowPeriod period) {
    switch (period) {
      case KeepaShowPeriod.day:
        return <bool>[true, false, false, false, false];
      case KeepaShowPeriod.week:
        return <bool>[false, true, false, false, false];
      case KeepaShowPeriod.month:
        return <bool>[false, false, true, false, false];
      case KeepaShowPeriod.threeMonth:
        return <bool>[false, false, false, true, false];
      case KeepaShowPeriod.year:
        return <bool>[false, false, false, false, true];
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asin = ref.watch(currentAsinProvider);
    final media = MediaQuery.of(context);
    final defaultSize = DefaultTextStyle.of(context).style.fontSize!;
    final scale = media.textScaleFactor;
    final height = defaultSize * scale * 2;

    final settings = ref.watch(generalSettingsControllerProvider
        .select((value) => value.keepaSettings));

    final displayState = useState(
        <bool>[settings.showNew, settings.showUsed, settings.showAmazon]);
    final rangeState = useState(_createRangeState(settings.period));

    String createUrl() {
      final params = <String>[
        "new=${displayState.value[0] ? "1" : "0"}",
        "used=${displayState.value[1] ? "1" : "0"}",
        "amazon=${displayState.value[2] ? "1" : "0"}",
      ];

      final index = rangeState.value.indexOf(true);
      switch (index) {
        case 0:
          params.add("range=1");
          break;
        case 1:
          params.add("range=7");
          break;
        case 2:
          params.add("range=31");
          break;
        case 3:
          params.add("range=90");
          break;
        case 4:
          params.add("range=365");
          break;
      }

      if (isDark(context)) {
        params.add("cBackground=000000&cFont=cdcdcd&cAmazon=ffba63&"
            "cNew=8888dd&cUsed=ffffff");
      }

      return "https://graph.keepa.com/pricehistory.png?"
          "asin=$asin&domain=co.jp&width=600&salesrank=1&height=300&"
          "${params.join("&")}${settings.extraParam}";
    }

    return Column(
      children: [
        ListTile(
          title: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ToggleButtons(
                  isSelected: displayState.value,
                  borderRadius: BorderRadius.circular(30),
                  onPressed: (index) {
                    // コピーするため toList する
                    final newState = displayState.value.toList();
                    newState[index] = !newState[index];
                    if (newState.any((e) => e)) {
                      // 1つ以上は常に選択されるようにする
                      displayState.value = newState;
                    }
                  },
                  constraints: BoxConstraints(
                      minWidth: (media.size.width - 40) / 3, minHeight: height),
                  children: const [
                    Text("新品"),
                    Text("中古"),
                    Text("Amazon"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ToggleButtons(
                  isSelected: rangeState.value,
                  borderRadius: BorderRadius.circular(30),
                  onPressed: (index) {
                    final newState =
                        List.generate(rangeState.value.length, (_) => false);
                    newState[index] = true;
                    rangeState.value = newState;
                  },
                  constraints: BoxConstraints(
                    minWidth: (media.size.width - 40) / 5,
                    minHeight: height,
                  ),
                  children: const [
                    Text("1日"),
                    Text("7日"),
                    Text("31日"),
                    Text("90日"),
                    Text("365日"),
                  ],
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: ExtendedImage.network(
            createUrl(),
            // "https://graph.keepa.com/pricehistory.png?asin=$asin&domain=co.jp&width=900&height=450&amazon=1&new=1&used=1&salesrank=1&range=31&cBackground=000000&cFont=cdcdcd&cAmazon=ffba63&cNew=8888dd&cUsed=ffffff",
            // "https://graph.keepa.com/pricehistory.png?new=1&domain=jp&width=600&asin=$asin&salesrank=1&height=300&range=all",
            // headers: <String, String>{
            //   "Cookie": cookie,
            // },
            fit: BoxFit.contain,
            mode: ExtendedImageMode.gesture,
            initGestureConfigHandler: (ExtendedImageState state) {
              return GestureConfig(
                minScale: 0.9,
                animationMinScale: 0.7,
                maxScale: 4,
                animationMaxScale: 4.5,
                speed: 1,
                inertialSpeed: 100,
                initialScale: 1,
                inPageView: false,
                initialAlignment: InitialAlignment.center,
              );
            },
          ),
        ),
        ElevatedButton(
          onPressed: () async {
            final url = "https://keepa.com/#!product/5-$asin/";
            await FlutterWebBrowser.openWebPage(url: url);
          },
          child: const Text("ブラウザで開く"),
        ),
        InkWell(
          onTap: () async {
            await showOkAlertDialog(
                context: context,
                message: "ブラウザで Keepa へログインした上で、"
                    "右上のボタンを押して再読み込みすると表示されるようになります。");
          },
          child: const Text(
            "ランキングが表示されない場合",
            style: TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
