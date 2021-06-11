import 'package:amasearch/controllers/search_item_controller.dart';
import 'package:amasearch/controllers/search_settings_controller.dart';
import 'package:amasearch/models/enums/search_type.dart';
import 'package:amasearch/pages/search/search_settings_page/search_settings_page.dart';
import 'package:amasearch/util/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

class SearchBar extends HookWidget with PreferredSizeWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  static const _elevation = 8.0;
  static const _horizontalMargin = 16.0;
  static const _borderRadius = BorderRadius.all(Radius.circular(8));

  @override
  Widget build(BuildContext context) {
    final textEditingController = useTextEditingController();
    final focusNode = useFocusNode();
    final settings = useProvider(searchSettingsControllerProvider);

    return KeyboardActions(
      disableScroll: true,
      config: KeyboardActionsConfig(
        keyboardActionsPlatform: KeyboardActionsPlatform.IOS,
        nextFocus: false,
        keyboardBarColor: isDark(context) ? Colors.black87 : Colors.grey[200],
        actions: [
          KeyboardActionsItem(
            focusNode: focusNode,
            toolbarButtons: [
              (node) {
                return ElevatedButton.icon(
                  icon: const Icon(Icons.search),
                  label: const Text("検索"),
                  onPressed: () {
                    node.unfocus();
                    final value = textEditingController.text;
                    if (value != "") {
                      _addItem(context, settings.type, value);
                      textEditingController.clear();
                    }
                  },
                );
              },
            ],
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          _horizontalMargin,
          MediaQuery.of(context).viewPadding.top + 6,
          _horizontalMargin,
          0,
        ),
        child: Material(
          elevation: _elevation,
          borderRadius: _borderRadius,
          child: Container(
            height: 48,
            alignment: Alignment.center,
            decoration: null,
            child: ClipRRect(
              borderRadius: _borderRadius,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: focusNode.requestFocus,
                      child: const Icon(Icons.search, color: Colors.grey),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: TextField(
                          focusNode: focusNode,
                          controller: textEditingController,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(fontSize: 18),
                          decoration: _createInputDecoration(
                            context,
                            settings.type,
                          ),
                          onSubmitted: (value) {
                            if (value != "") {
                              _addItem(context, settings.type, value);
                              textEditingController.clear();
                            }
                          },
                        ),
                      ),
                    ),
                    Padding(
                      // ボタン長押しした際のリップルに TextField が被るので Padding を入れる
                      padding: const EdgeInsets.only(left: 8),
                      child: IconButton(
                        icon: const Icon(Icons.settings),
                        onPressed: () {
                          unfocus();
                          Navigator.of(context)
                              .push(SearchSettingsPage.route());
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _createInputDecoration(
      BuildContext context, SearchType type) {
    final text = _getHintText(type);

    return InputDecoration(
      isDense: true,
      contentPadding: EdgeInsets.zero,
      border: InputBorder.none,
      errorBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      focusedErrorBorder: InputBorder.none,
      fillColor: ElevationOverlay.applyOverlay(
        context,
        Theme.of(context).canvasColor,
        _elevation,
      ),
      hintText: text,
    );
  }

  String _getHintText(SearchType type) {
    switch (type) {
      case SearchType.jan:
        return "JANコード";
      case SearchType.bookoff:
        return "BookOff";
      case SearchType.geo:
        return "Geo";
      case SearchType.tsutaya:
        return "TSUTAYA";
      case SearchType.freeWord:
        // deprecated
        break;
    }
    throw Exception("Unknown SearchType: $type");
  }

  void _addItem(BuildContext context, SearchType type, String code) {
    switch (type) {
      case SearchType.jan:
        context.read(searchItemControllerProvider.notifier).add(code);
        return;
      case SearchType.bookoff:
        context.read(searchItemControllerProvider.notifier).addBookoff(code);
        return;
      case SearchType.geo:
        context.read(searchItemControllerProvider.notifier).addGeo(code);
        return;
      case SearchType.tsutaya:
        context.read(searchItemControllerProvider.notifier).addTsutaya(code);
        return;
      case SearchType.freeWord:
        // deprecated
        break;
    }
    throw Exception("Unknown type: $type");
  }
}
