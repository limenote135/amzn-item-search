import 'package:amasearch/models/item.dart';
import 'package:amasearch/repository/mws.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final searchItemResultProvider =
    FutureProvider.family<List<AsinData>, String>((ref, query) async {
  final mws = ref.read(mwsRepositoryProvider);
  final resp = await mws.listMatchingProducts(query);
  return resp.items;
});
