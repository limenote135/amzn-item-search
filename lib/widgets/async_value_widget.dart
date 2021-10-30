import 'package:amasearch/util/error_report.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'progress_indicator.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget({
    Key? key,
    required this.value,
    required this.data,
    this.errorInfo = const [],
  }) : super(key: key);

  final AsyncValue<T> value;
  final Widget Function(T) data;
  final Iterable<String> errorInfo;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      loading: (_) => centeredCircularProgressIndicator,
      error: (e, st, _) {
        recordError(e, st, information: errorInfo);
        return ListTile(
          title: Text("$e"),
        );
      },
    );
  }
}

class AsyncValueListTileWidget<T> extends StatelessWidget {
  const AsyncValueListTileWidget({
    Key? key,
    required this.value,
    required this.data,
    this.errorInfo = const [],
  }) : super(key: key);

  final AsyncValue<T> value;
  final Widget Function(T) data;
  final Iterable<String> errorInfo;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      loading: (_) => const ListTile(
        title: centeredCircularProgressIndicator,
      ),
      error: (e, st, _) {
        recordError(e, st, information: errorInfo);
        return ListTile(
          title: Text("$e"),
        );
      },
    );
  }
}
