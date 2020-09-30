import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
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
