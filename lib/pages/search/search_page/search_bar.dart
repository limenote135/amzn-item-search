import 'dart:io';

import 'package:amasearch/controllers/search_item_controller.dart';
import 'package:amasearch/controllers/search_settings_controller.dart';
import 'package:amasearch/models/enums/search_type.dart';
import 'package:amasearch/pages/search/search_settings_page/search_settings_page.dart';
import 'package:amasearch/util/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

class SearchBar extends HookConsumerWidget with PreferredSizeWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  static const _elevation = 8.0;
  static const _horizontalMargin = 16.0;
  static const _borderRadius = BorderRadius.all(Radius.circular(8));

  static void _doNotHideKeyboardCallBack() {}

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textEditingController = useTextEditingController();
    final focusNode = useFocusNode();
    final settings = ref.watch(searchSettingsControllerProvider);

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
                    if (!settings.continuousInput) {
                      node.unfocus();
                    }
                    final value = textEditingController.text;
                    if (value != "") {
                      _addItem(context, ref, settings.type, value);
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
                          onEditingComplete: settings.continuousInput
                              ? _doNotHideKeyboardCallBack
                              : null,
                          onSubmitted: (value) async {
                            if (value != "") {
                              _addItem(context, ref, settings.type, value);
                              textEditingController.clear();
                              if (Platform.isIOS && settings.continuousInput) {
                                await Future<void>.delayed(
                                  const Duration(milliseconds: 200),
                                );
                                await SystemChannels.textInput
                                    .invokeMethod<void>('TextInput.show');
                              }
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
    BuildContext context,
    SearchType type,
  ) {
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
        return "JANコード検索";
      case SearchType.bookoff:
        return "BookOff 検索";
      case SearchType.geo:
        return "GEO 検索";
      case SearchType.tsutaya:
        return "TSUTAYA 検索";
      case SearchType.freeWord:
        // deprecated
        break;
    }
    throw Exception("Unknown SearchType: $type");
  }

  void _addItem(
    BuildContext context,
    WidgetRef ref,
    SearchType type,
    String code,
  ) {
    switch (type) {
      case SearchType.jan:
        ref.read(searchItemControllerProvider.notifier).add(code);
        return;
      case SearchType.bookoff:
        ref.read(searchItemControllerProvider.notifier).addBookoff(code);
        return;
      case SearchType.geo:
        ref.read(searchItemControllerProvider.notifier).addGeo(code);
        return;
      case SearchType.tsutaya:
        ref.read(searchItemControllerProvider.notifier).addTsutaya(code);
        return;
      case SearchType.freeWord:
        // deprecated
        break;
    }
    throw Exception("Unknown type: $type");
  }
}
