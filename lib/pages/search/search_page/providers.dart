import 'package:ama_search/models/item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentItemFutureProvider = ScopedProvider<FutureProvider<Item>>(null);

final currentItemProvider = ScopedProvider<Item>(null);

final currentAsinDataProvider = ScopedProvider<AsinData>(null);

final currentAsinCountProvider = ScopedProvider<int>(null);