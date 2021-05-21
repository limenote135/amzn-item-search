import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final dioProvider = Provider((_) {
  final dio = Dio();

  //TODO: せどりすとの URL の証明書がおかしい？ようなので暫定対処
  // CERTIFICATE_VERIFY_FAILED: unable to get local issuer certificate
  (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
      (HttpClient client) {
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    return client;
  };

  return dio;
});

final persistCookieJarProvider = Provider((_) {
  return PersistCookieJar();
});

final dioWithCookieProvider = Provider((ref) {
  final dio = Dio();
  final jar = ref.read(persistCookieJarProvider);
  dio.interceptors.add(CookieManager(jar));
  return dio;
});
