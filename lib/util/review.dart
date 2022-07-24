import 'package:in_app_review/in_app_review.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _prefKey = "request_count";

Future<void> requestReview() async {
  final prefs = await SharedPreferences.getInstance();
  final currentCount = prefs.getInt(_prefKey) ?? 0;
  final newCount = currentCount + 1 % 32;
  await prefs.setInt(_prefKey, newCount);
  if (newCount % 8 != 0) {
    return;
  }
  final ins = InAppReview.instance;
  if (await ins.isAvailable()) {
    await ins.requestReview();
  }
}
