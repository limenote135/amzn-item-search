import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/analytics/events.dart';
import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/models/enums/keepa_show_period.dart';
import 'package:amasearch/models/keepa_settings.dart';
import 'package:amasearch/util/keepa.dart';
import 'package:amasearch/util/util.dart';
import 'package:amasearch/widgets/keepa_ua_async_widget.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

final currentAsinProvider = Provider<String>((_) => throw UnimplementedError());

class KeepaPage extends ConsumerWidget {
  const KeepaPage({super.key});

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
      ),
      body: const _Body(),
    );
  }
}

class _Body extends HookConsumerWidget {
  const _Body();

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
    final scaledFontSize = media.textScaler.scale(defaultSize);
    final height = scaledFontSize * 2;

    final settings = ref.watch(
      generalSettingsControllerProvider.select((value) => value.keepaSettings),
    );

    final displayState = useState(
      <bool>[settings.showNew, settings.showUsed, settings.showAmazon],
    );
    final showBuyBox = useState(settings.showFba);
    final showFba = useState(settings.showFba);
    final rangeState1 = useState(_createRangeState(settings.period));
    final rangeState2 = useState(_createRangeState(settings.period));

    String createUrl(List<bool> range) {
      var baseParam = settings.extraParam;
      if (isDark(context)) {
        baseParam += "&cBackground=000000&cFont=cdcdcd&cAmazon=ffba63"
            "&cNew=8888dd&cUsed=ffffff";
      }

      final index = range.indexOf(true);
      final s = KeepaSettings(
        showNew: displayState.value[0],
        showUsed: displayState.value[1],
        showAmazon: displayState.value[2],
        showBuyBox: showBuyBox.value,
        showFba: showFba.value,
        period: switch (index) {
          0 => KeepaShowPeriod.day, // 1日
          1 => KeepaShowPeriod.week, // 7日
          2 => KeepaShowPeriod.month, // 31日
          3 => KeepaShowPeriod.threeMonth, // 90日
          4 => KeepaShowPeriod.year, // 365日
          _ => KeepaShowPeriod.month,
        },
        extraParam: baseParam,
      );

      final key = settings.useApiKey ? settings.apiKey : "";

      return createKeepaUrl(
        asin,
        s,
        width: "600",
        height: "300",
        key: key,
      );
    }

    return Column(
      children: [
        ToggleButtons(
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
            minWidth: (media.size.width - 40) / 3,
            minHeight: height,
          ),
          children: const [
            Text("新品"),
            Text("中古"),
            Text("Amazon"),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    const Text("カート価格"),
                    const Spacer(),
                    Switch(
                      value: showBuyBox.value,
                      onChanged: (value) {
                        showBuyBox.value = value;
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    const Text("FBA 配送"),
                    const Spacer(),
                    Switch(
                      value: showFba.value,
                      onChanged: (value) {
                        showFba.value = value;
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const ThemeDivider(),
        ToggleButtons(
          isSelected: rangeState1.value,
          borderRadius: BorderRadius.circular(30),
          onPressed: (index) {
            final newState =
                List.generate(rangeState1.value.length, (_) => false);
            newState[index] = true;
            rangeState1.value = newState;
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
        _KeepaImage(url: createUrl(rangeState1.value)),
        const ThemeDivider(),
        ToggleButtons(
          isSelected: rangeState2.value,
          borderRadius: BorderRadius.circular(30),
          onPressed: (index) {
            final newState =
                List.generate(rangeState2.value.length, (_) => false);
            newState[index] = true;
            rangeState2.value = newState;
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
        _KeepaImage(url: createUrl(rangeState2.value)),
        ElevatedButton(
          onPressed: () async {
            await ref
                .read(analyticsControllerProvider)
                .logPushSearchButtonEvent(pushSearchButtonOpenKeepaName);
            final url = "https://keepa.com/#!product/5-$asin/";
            await launchUrl(Uri.parse(url), mode: LaunchMode.inAppBrowserView);
          },
          child: const Text("ブラウザで開く"),
        ),
      ],
    );
  }
}

class _KeepaImage extends StatelessWidget {
  const _KeepaImage({required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: KeepaUaAsyncWidget(
        builder: (ua) => ExtendedImage.network(
          url,
          // "https://graph.keepa.com/pricehistory.png?asin=$asin&domain=co.jp&width=900&height=450&amazon=1&new=1&used=1&salesrank=1&range=31&cBackground=000000&cFont=cdcdcd&cAmazon=ffba63&cNew=8888dd&cUsed=ffffff",
          // "https://graph.keepa.com/pricehistory.png?new=1&domain=jp&width=600&asin=$asin&salesrank=1&height=300&range=all",
          // headers: <String, String>{
          //   "Cookie": cookie,
          // },
          headers: ua != ""
              ? <String, String>{
                  "User-Agent": ua,
                }
              : null,
          fit: BoxFit.contain,
          mode: ExtendedImageMode.gesture,
          initGestureConfigHandler: (ExtendedImageState state) {
            return GestureConfig(
              minScale: 0.9,
              animationMinScale: 0.7,
              maxScale: 4,
              animationMaxScale: 4.5,
            );
          },
        ),
      ),
    );
  }
}
