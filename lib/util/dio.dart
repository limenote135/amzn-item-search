import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';

final persistCookieJarProvider = FutureProvider((_) async {
  final appDocDir = await getApplicationDocumentsDirectory();
  final appDocPath = appDocDir.path;
  return PersistCookieJar(storage: FileStorage("$appDocPath/.cookies/"));
});

final dioProvider = FutureProvider((ref) async {
  final dio = Dio();

  final jar = await ref.watch(persistCookieJarProvider.future);
  dio.interceptors.add(CookieManager(jar));

  return dio;
});
