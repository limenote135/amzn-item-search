import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final ttsProvider = Provider((ref) => TextToSpeech(ref.read));

class TextToSpeech {
  TextToSpeech(this._reader) : _flutterTts = FlutterTts() {
    final settings = _reader(generalSettingsControllerProvider);
    Future(() async {
      final dynamic languages = await _flutterTts.getLanguages;
      for (final lang in languages) {
        if (lang == "ja-JP") {
          await _flutterTts.setLanguage("ja-JP");
          break;
        }
      }

      await _flutterTts.setVolume(settings.readAloudVolume);
      if (settings.readAloudSpeed != null) {
        await _flutterTts.setSpeechRate(settings.readAloudSpeed!);
      } else {
        final range = await getRange();
        await _flutterTts.setSpeechRate(range.normal);

        _reader(generalSettingsControllerProvider.notifier)
            .update(readAloudSpeed: range.normal);
      }
    });
  }

  final FlutterTts _flutterTts;
  final Reader _reader;

  void speak(String text) {
    _flutterTts.speak(text);
  }

  Future<void> setVolume(double volume) {
    return _flutterTts.setVolume(volume);
  }

  Future<void> setSpeed(double speed) {
    return _flutterTts.setSpeechRate(speed);
  }

  Future<SpeechRateValidRange> getRange() {
    return _flutterTts.getSpeechRateValidRange;
  }
}
