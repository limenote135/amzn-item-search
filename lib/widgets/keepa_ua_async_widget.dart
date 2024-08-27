import 'dart:async';

import 'package:amasearch/util/random.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const _keepaUaConfigName = "kpua";

final _currentUaProvider = StateProvider((ref) => "");
final _randomUaProvider = Provider((_) {
  final len = randomIntWithRange(4, 7);
  final base = randomString(len);
  final version = "0.${randomIntWithDigit(2)}.${randomIntWithDigit(4)}";

  // Keepa のグラフアクセスを大量に行うとブロックされるので、ランダムで UA を変更する
  // リクエストごとにランダムにしてもよいが、ユーザー単位で固定しておくために
  // グローバルな HttpClient で書き換える
  return "ama$base/$version";
});

final _uaProvider = FutureProvider((ref) async {
  final timer = Timer.periodic(const Duration(minutes: 5), (timer) {
    // 5分毎に UA が変わっていないかチェックする
    ref.invalidateSelf();
  });
  ref.onDispose(timer.cancel);

  final remoteConfig = FirebaseRemoteConfig.instance;
  try {
    final defaultValues = <String, dynamic>{
      _keepaUaConfigName: "",
    };
    await remoteConfig.setDefaults(defaultValues);
    await remoteConfig.fetchAndActivate();
    final ua = remoteConfig.getString(_keepaUaConfigName);
    final old = ref.read(_currentUaProvider);
    if (ua != old) {
      ref.read(_currentUaProvider.notifier).state = ua;
    }
    return ua;

    // ignore: avoid_catches_without_on_clauses
  } catch (_, __) {
    return "";
  }
});

const _placeholder = SizedBox(width: 50, height: 50);

class KeepaUaAsyncWidget extends ConsumerWidget {
  const KeepaUaAsyncWidget({super.key, required this.builder});

  final Widget Function(String ua) builder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uaAsync = ref.watch(_uaProvider);
    final randomUa = ref.watch(_randomUaProvider);
    return uaAsync.when(
      error: (error, stackTrace) => _placeholder,
      loading: () => _placeholder,
      data: (data) {
        if (data.isEmpty) {
          return builder(randomUa);
        }
        return builder(data);
      },
    );
  }
}
