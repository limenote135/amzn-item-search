import 'package:amasearch/util/util.dart';
import 'package:flutter/material.dart';

Widget contextMenuBuilder(
  BuildContext context,
  EditableTextState editableTextState,
) {
  final items = editableTextState.contextMenuButtonItems;
  return AdaptiveTextSelectionToolbar.buttonItems(
    anchors: editableTextState.contextMenuAnchors,
    buttonItems: items,
  );
}

void onTapOutside(PointerDownEvent event) {
  unfocus();
}
