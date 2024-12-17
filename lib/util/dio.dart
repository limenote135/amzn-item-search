import 'dart:io';

import 'package:amasearch/util/error_report.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';

final persistCookieJarProvider = FutureProvider((_) async {
  final appDocDir = await getApplicationDocumentsDirectory();
  final appDocPath = appDocDir.path;
  return PersistCookieJar(storage: FileStorage("$appDocPath/.cookies/"));
});

final dioCookieProvider = FutureProvider((ref) async {
  final dio = Dio();

  final jar = await ref.watch(persistCookieJarProvider.future);
  dio.interceptors.add(CookieManager(jar));

  return HttpClient(dio);
});

final dioRetryProvider = Provider((ref) {
  final dio = Dio();

  final statuses = defaultRetryableStatuses.toSet()
    ..removeAll([
      status429TooManyRequests,
    ]);
  dio.interceptors.add(
    RetryInterceptor(
      dio: dio,
      retryDelays: const [
        Duration(seconds: 1),
        Duration(seconds: 1),
        Duration(seconds: 2),
      ],
      retryEvaluator: DefaultRetryEvaluator(statuses).evaluate,
    ),
  );

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
    } on DioException catch (e, stack) {
      await FirebaseCrashlytics.instance.log("Get request: $url");
      if (e.error is SocketException) {
        await FirebaseCrashlytics.instance.log("SocketException");
        throw Exception("通信環境の良いところで再度お試しください");
      }
      if (e.type == DioExceptionType.cancel) {
        await FirebaseCrashlytics.instance.log("DioErrorType.cancel");
        throw Exception("通信エラー");
      }
      if (e.response == null || e.response!.statusCode == null) {
        await recordError(
          e,
          stack,
          information: [
            "response or status code is null",
            "URL: $url",
            "resp: ${e.response}",
          ],
        );
        throw Exception("通信環境の良いところで再度お試しください");
      }
      final code = e.response!.statusCode!;
      if (code == 429) {
        // 429: Too Many Requests
        throw Exception("少し時間をおいて再度お試しください");
      }
      customHandler?.call(code);

      if (code >= 500) {
        // サーバーサイドエラー
        await recordError(
          e,
          stack,
          information: [
            "ServerSideError: $code",
            "URL: $url",
            "resp: ${e.response}",
          ],
        );
        throw Exception("サーバーエラー($code)");
      }
      await recordError(
        e,
        stack,
        information: [
          "Unknown error",
          "URL: $url",
          "resp: ${e.response}",
        ],
      );
      throw Exception("通信環境の良いところで再度お試しください");
    } on SocketException catch (e, stack) {
      await recordError(
        e,
        stack,
        information: [
          "SocketException",
          "URL: $url",
        ],
      );
      throw Exception("通信環境の良いところで再度お試しください");
    }
  }

  Future<Response<String>> post(
    String url, {
    dynamic data,
    Options? opt,
    void Function(int code)? customHandler,
    CancelToken? cancelToken,
    bool isPaidUser = true,
  }) async {
    try {
      return await dio.post<String>(
        url,
        data: data,
        options: opt,
        cancelToken: cancelToken,
      );
    } on DioException catch (e, stack) {
      await FirebaseCrashlytics.instance.log("Post request: $url");
      if (e.error is SocketException) {
        await FirebaseCrashlytics.instance.log("SocketException");
        throw Exception("通信環境の良いところで再度お試しください");
      }
      if (e.type == DioExceptionType.cancel) {
        await FirebaseCrashlytics.instance.log("DioErrorType.cancel");
        throw Exception("通信エラー");
      }
      if (e.response == null || e.response!.statusCode == null) {
        await recordError(
          e,
          stack,
          information: [
            "response or status code is null",
            "URL: $url",
            "params: $data",
            "resp: ${e.response}",
          ],
        );
        throw Exception("通信環境の良いところで再度お試しください");
      }
      final code = e.response!.statusCode!;
      if (code == 429) {
        // 429: Too Many Requests
        if (isPaidUser) {
          throw Exception("短時間のリクエストが多すぎます。少し時間をおいて再度お試しください");
        } else {
          await Future<void>.delayed(const Duration(seconds: 2));
          throw Exception("フリープランの短期間リクエスト上限です。少し時間をおいて再度お試しください。");
        }
      }
      customHandler?.call(code);

      if (code >= 500) {
        // サーバーサイドエラー
        await recordError(
          e,
          stack,
          information: [
            "ServerSideError: $code",
            "URL: $url",
            "params: $data",
            "resp: ${e.response}",
          ],
        );
        throw Exception("サーバーエラー($code)");
      }
      await recordError(
        e,
        stack,
        information: [
          "Unknown error",
          "URL: $url",
          "params: $data",
          "resp: ${e.response}",
        ],
      );
      throw Exception("通信環境の良いところで再度お試しください");
    } on SocketException catch (e, stack) {
      await recordError(
        e,
        stack,
        information: [
          "SocketException",
          "URL: $url",
          "params: $data",
        ],
      );
      throw Exception("通信環境の良いところで再度お試しください");
    }
  }
}
