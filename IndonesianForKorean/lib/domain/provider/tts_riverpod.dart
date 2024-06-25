import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../screen/content/s_content.dart';

final flutterTtsProvider = Provider<FlutterTts>((ref) {
  final flutterTts = FlutterTts();

  flutterTts.setStartHandler(() {
    ref.read(speakingStateProvider.notifier).state = true;
  });

  flutterTts.setCompletionHandler(() {
    ref.read(speakingStateProvider.notifier).state = false;
    ref.read(progressProvider.notifier).state = 0.0;
  });

  flutterTts.setCancelHandler(() {
    ref.read(speakingStateProvider.notifier).state = false;
    ref.read(progressProvider.notifier).state = 0.0;
  });

  flutterTts.setProgressHandler((String text, int start, int end, String word) {
    double progress = end / text.length;
    ref.read(progressProvider.notifier).state = progress;
  });

  return flutterTts;
});
