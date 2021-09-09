import 'dart:io';

import 'package:amasearch/util/error_report.dart';
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
    void Function(int code)? customHandler,
    CancelToken? cancelToken,
  }) async {
    try {
      return await dio.get<String>(
        url,
        queryParameters: query,
        options: opt,
        cancelToken: cancelToken,
      );
    } on DioError catch (e, stack) {
      await FirebaseCrashlytics.instance.log("Get request: $url");
      if (e.error is SocketException) {
        await FirebaseCrashlytics.instance.log("SocketException");
        throw Exception("通信環境の良いところで再度お試しください");
      }
      if (e.type == DioErrorType.cancel) {
        await FirebaseCrashlytics.instance.log("DioErrorType.cancel");
        throw Exception("通信エラー");
      }
      if (e.response == null || e.response!.statusCode == null) {
        await recordError(e, stack, information: [
          DiagnosticsNode.message("response or status code is null"),
          DiagnosticsNode.message("URL: $url"),
          DiagnosticsNode.message("resp: ${e.response.toString()}"),
        ]);
        throw Exception("通信環境の良いところで再度お試しください");
      }
      final code = e.response!.statusCode!;
      customHandler?.call(code);

      if (code >= 500) {
        // サーバーサイドエラー
        await recordError(e, stack, information: [
          DiagnosticsNode.message("ServerSideError: $code"),
          DiagnosticsNode.message("URL: $url"),
          DiagnosticsNode.message("resp: ${e.response.toString()}"),
        ]);
        throw Exception("サーバーエラー($code)");
      }
      await recordError(e, stack, information: [
        DiagnosticsNode.message("Unknown error"),
        DiagnosticsNode.message("URL: $url"),
        DiagnosticsNode.message("resp: ${e.response.toString()}"),
      ]);
      throw Exception("通信環境の良いところで再度お試しください");
    } on SocketException catch (e, stack) {
      await recordError(e, stack, information: [
        DiagnosticsNode.message("SocketException"),
        DiagnosticsNode.message("URL: $url"),
      ]);
      throw Exception("通信環境の良いところで再度お試しください");
    }
  }

  Future<Response<String>> post(
    String url, {
    dynamic data,
    Options? opt,
    void Function(int code)? customHandler,
    CancelToken? cancelToken,
  }) async {
    try {
      return await dio.post<String>(
        url,
        data: data,
        options: opt,
        cancelToken: cancelToken,
      );
    } on DioError catch (e, stack) {
      await FirebaseCrashlytics.instance.log("Post request: $url");
      if (e.error is SocketException) {
        await FirebaseCrashlytics.instance.log("SocketException");
        throw Exception("通信環境の良いところで再度お試しください");
      }
      if (e.type == DioErrorType.cancel) {
        await FirebaseCrashlytics.instance.log("DioErrorType.cancel");
        throw Exception("通信エラー");
      }
      if (e.response == null || e.response!.statusCode == null) {
        await recordError(e, stack, information: [
          DiagnosticsNode.message("response or status code is null"),
          DiagnosticsNode.message("URL: $url"),
          DiagnosticsNode.message("params: $data"),
          DiagnosticsNode.message("resp: ${e.response.toString()}"),
        ]);
        throw Exception("通信環境の良いところで再度お試しください");
      }
      final code = e.response!.statusCode!;
      customHandler?.call(code);

      if (code >= 500) {
        // サーバーサイドエラー
        await recordError(e, stack, information: [
          DiagnosticsNode.message("ServerSideError: $code"),
          DiagnosticsNode.message("URL: $url"),
          DiagnosticsNode.message("params: $data"),
          DiagnosticsNode.message("resp: ${e.response.toString()}"),
        ]);
        throw Exception("サーバーエラー($code)");
      }
      await recordError(e, stack, information: [
        DiagnosticsNode.message("Unknown error"),
        DiagnosticsNode.message("URL: $url"),
        DiagnosticsNode.message("params: $data"),
        DiagnosticsNode.message("resp: ${e.response.toString()}"),
      ]);
      throw Exception("通信環境の良いところで再度お試しください");
    } on SocketException catch (e, stack) {
      await recordError(e, stack, information: [
        DiagnosticsNode.message("SocketException"),
        DiagnosticsNode.message("URL: $url"),
        DiagnosticsNode.message("params: $data"),
      ]);
      throw Exception("通信環境の良いところで再度お試しください");
    }
  }
}
