import 'dart:io';

import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final ttsProvider = Provider(TextToSpeech.new);

class TextToSpeech {
  TextToSpeech(this._ref) : _flutterTts = FlutterTts() {
    final settings = _ref.read(generalSettingsControllerProvider);
    Future(() async {
      final dynamic languages = await _flutterTts.getLanguages;
      if (languages is List<dynamic>) {
        for (final lang in languages) {
          if (lang == "ja-JP") {
            await _flutterTts.setLanguage("ja-JP");
            break;
          }
        }
      }

      await _flutterTts.setVolume(settings.readAloudVolume);
      if (settings.readAloudSpeed != null) {
        await _flutterTts.setSpeechRate(settings.readAloudSpeed!);
      } else {
        final range = await getRange();
        await _flutterTts.setSpeechRate(range.normal);

        _ref
            .read(generalSettingsControllerProvider.notifier)
            .update(readAloudSpeed: range.normal);
      }

      if (Platform.isIOS) {
        await _flutterTts
            .setIosAudioCategory(IosTextToSpeechAudioCategory.ambientSolo, [
          IosTextToSpeechAudioCategoryOptions.allowBluetooth,
          IosTextToSpeechAudioCategoryOptions.allowBluetoothA2DP,
        ]);
      }
    });
  }

  final FlutterTts _flutterTts;
  final Ref _ref;

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
