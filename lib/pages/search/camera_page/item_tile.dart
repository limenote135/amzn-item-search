import 'package:amasearch/models/enums/search_type.dart';
import 'package:amasearch/models/item.dart';
import 'package:amasearch/pages/search/camera_page/camera_page.dart';
import 'package:amasearch/pages/search/common/route_from.dart';
import 'package:amasearch/pages/search/search_page/item_tile.dart';
import 'package:amasearch/repository/bookoff.dart';
import 'package:amasearch/repository/geo.dart';
import 'package:amasearch/repository/tsutaya.dart';
import 'package:amasearch/util/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentCodeProvider = ScopedProvider<String>(null);
final currentCodeTypeProvider = ScopedProvider<SearchType>(null);

final _currentJanProvider = ScopedProvider<String>(null);

class ItemTile extends HookWidget {
  const ItemTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final code = useProvider(currentCodeProvider);
    final type = useProvider(currentCodeTypeProvider);
    if (code == "") {
      return Container();
    }
    // TODO: FutureProvider に置き換えたい
    final future = _getFuture(context, code, type);
    return FutureBuilder(
      future: future,
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (!snapshot.hasData) {
          return const ListTile(
            tileColor: Colors.white,
            title: Center(child: CircularProgressIndicator()),
          );
        }
        return ProviderScope(
          overrides: [
            _currentJanProvider.overrideWithValue(snapshot.data),
          ],
          child: const _TileImpl(),
        );
      },
    );
  }

  Future<String> _getFuture(
      BuildContext context, String code, SearchType type) {
    switch (type) {
      case SearchType.jan:
        return Future.value(code);
      case SearchType.bookoff:
        return context.read(bookoffJanFutureProvider(code).future);
      case SearchType.geo:
        return context.read(geoJanFutureProvider(code).future);
      case SearchType.tsutaya:
        return Future.value(getTsutayaJanCode(code));
      case SearchType.freeWord:
        // deprecated
        break;
    }
    throw Exception("Invalid SearchType: $type");
  }
}

class _TileImpl extends HookWidget {
  const _TileImpl({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final jan = useProvider(_currentJanProvider);
    // 読み上げる必要がないので、itemFutureProvider ではなく itemFutureProviderImpl にする
    final temp = useProvider(itemFutureProviderImpl(jan));
    final color =
        isDark(context) ? Theme.of(context).backgroundColor : Colors.white;
    return temp.when(
      loading: () => ListTile(
        tileColor: color,
        title: const Center(child: CircularProgressIndicator()),
      ),
      error: (error, stackTrace) => ListTile(
        title: Container(
          color: color,
          height: 30,
          child: Text("$error"),
        ),
      ),
      data: (value) {
        final data = useProvider(value.state);
        if (data.asins.isEmpty) {
          return Center(
            child: Container(
              color: color,
              height: 30,
              child: Text("${data.jan}: 見つかりませんでした"),
            ),
          );
        }

        return ProviderScope(
          overrides: [
            currentItemControllerProvider.overrideWithValue(value),
            fromRouteProvider.overrideWithValue(CameraPage.routeName),
          ],
          child: Container(
            color: color,
            child: const ItemTileImpl(),
          ),
        );
      },
    );
  }
}
