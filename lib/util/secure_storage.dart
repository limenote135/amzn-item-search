import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod/riverpod.dart';

final secureStorageProvider = Provider((_) {
  const androidOptions = AndroidOptions(
    encryptedSharedPreferences: true,
  );
  const storage = FlutterSecureStorage(aOptions: androidOptions);
  return storage;
});
