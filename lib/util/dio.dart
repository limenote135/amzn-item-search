import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
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

  return HttpClient(dio);
});

class HttpClient {
  HttpClient(this.dio);

  final Dio dio;

  Future<Response<String>> get(
    String url, {
    Map<String, dynamic>? query,
    Options? opt,
    CancelToken? cancelToken,
  }) async {
    try {
      return dio.get<String>(
        url,
        queryParameters: query,
        options: opt,
        cancelToken: cancelToken,
      );
    } on DioError catch (e, stack) {
      if (e.error is SocketException) {
        throw Exception("通信環境の良いところで再度お試しください");
      }
      if (e.response == null || e.response!.statusCode == null) {
        await FirebaseCrashlytics.instance.recordError(
          e,
          stack,
          information: [DiagnosticsNode.message(url)],
        );
        rethrow;
      }
      final code = e.response!.statusCode!;
      if (code >= 500) {
        // サーバーサイドエラー
        await FirebaseCrashlytics.instance.recordError(
          e,
          stack,
          information: [
            DiagnosticsNode.message(url),
            DiagnosticsNode.message(e.response.toString()),
          ],
        );
        throw Exception("サーバーエラー($code)");
      }
      await FirebaseCrashlytics.instance.recordError(
        e,
        stack,
        information: [
          DiagnosticsNode.message(url),
          DiagnosticsNode.message(e.response.toString()),
        ],
      );
      rethrow;
    } on SocketException catch (e, stack) {
      await FirebaseCrashlytics.instance.recordError(
        e,
        stack,
        information: [DiagnosticsNode.message(url)],
      );
      throw Exception("通信環境の良いところで再度お試しください");
    }
  }

  Future<Response<String>> post(
    String url, {
    dynamic data,
    Options? opt,
    void Function(int code)? customHandler,
  }) async {
    try {
      return dio.post<String>(url, data: data, options: opt);
    } on DioError catch (e, stack) {
      if (e.error is SocketException) {
        throw Exception("通信環境の良いところで再度お試しください");
      }
      if (e.response == null || e.response!.statusCode == null) {
        await FirebaseCrashlytics.instance.recordError(
          e,
          stack,
          information: [
            DiagnosticsNode.message(url),
            DiagnosticsNode.message(e.response.toString()),
          ],
        );
        rethrow;
      }
      final code = e.response!.statusCode!;
      customHandler?.call(code);

      if (code >= 500) {
        // サーバーサイドエラー
        await FirebaseCrashlytics.instance.recordError(
          e,
          stack,
          information: [
            DiagnosticsNode.message(url),
            DiagnosticsNode.message(e.response.toString()),
          ],
        );
        throw Exception("サーバーエラー($code)");
      }
      await FirebaseCrashlytics.instance.recordError(
        e,
        stack,
        information: [
          DiagnosticsNode.message(url),
          DiagnosticsNode.message(e.response.toString()),
        ],
      );
      rethrow;
    } on SocketException catch (e, stack) {
      await FirebaseCrashlytics.instance.recordError(
        e,
        stack,
        information: [DiagnosticsNode.message(url)],
      );
      throw Exception("通信環境の良いところで再度お試しください");
    }
  }
}
