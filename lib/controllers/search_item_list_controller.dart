import 'package:amasearch/models/mws.dart';
import 'package:amasearch/models/search_item.dart';
import 'package:amasearch/repository/mws.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final searchItemResultProvider =
    FutureProvider.family<List<AsinData>, ListMatchingProductRequest>(
        (ref, req) async {
  final mws = ref.read(mwsRepositoryProvider);
  final resp = await mws.listMatchingProducts(req.query, req.category);
  return resp.items;
});
