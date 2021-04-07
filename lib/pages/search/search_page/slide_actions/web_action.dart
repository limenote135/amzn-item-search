import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/analytics/events.dart';
import 'package:amasearch/models/general_settings.dart';
import 'package:amasearch/models/search_item.dart';
import 'package:amasearch/util/url_replacer.dart';
import 'package:amasearch/util/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentCustomButtonActionProvider =
    Provider<CustomButtonDetail>((ref) => throw UnimplementedError());

class WebAction extends HookConsumerWidget {
  const WebAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(currentSearchItemProvider);
    final button = ref.watch(currentCustomButtonActionProvider);

    final url = replaceUrl(template: button.pattern, item: items.asins.first);
    final eventName = customButtonEventMap.containsKey(button.pattern)
        ? customButtonEventMap[button.pattern]!
        : button.pattern;
    return IconSlideAction(
      caption: button.title,
      color: Colors.indigo,
      icon: Icons.search,
      onTap: () async {
        unfocus();
        await ref
            .read(analyticsControllerProvider)
            .logPushSearchButtonEvent(eventName);
        await FlutterWebBrowser.openWebPage(url: url);
      },
    );
  }
}
