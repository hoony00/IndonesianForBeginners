import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../../controller/tts_controller.dart';
import '../../provider/chapter.riverpod.dart';
import '../../../global/components/app_bar/custom_app_bar.dart';
import '../../provider/tts_riverpod.dart';

/// todo : 내부 DB 혹은 local Storage 에서 가져오는 것으로 변경

/// 음성 속도
final speechRateProvider = StateProvider<double>((ref) => 0.5);

/// 음성 높낮이
final pitchProvider = StateProvider<double>((ref) => 1.0);

/// 음성 재생 상태
final speakingStateProvider = StateProvider<bool>((ref) => false);

/// 음성 재생 진행률
final progressProvider = StateProvider<double>((ref) => 0.0);

class ContentScreen extends ConsumerStatefulWidget {
  const ContentScreen({super.key});

  @override
  ConsumerState<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends ConsumerState<ContentScreen> {
  String _currentText = '';

  Future<void> speak(String text) async {
    final flutterTts = ref.read(flutterTtsProvider);

    /// 언어 설정 (지금은 인디어만 지원)
    await flutterTts.setLanguage('id-ID');

    /// 진행 중이던 음성 재생 중지
    await flutterTts.stop();
    /// 선택된 텍스트 가져옴
    _currentText = text;

    /// 음성 속도 및 피치 설정
    final speechRate = ref.read(speechRateProvider);
    await flutterTts.setSpeechRate(speechRate);

    final pitch = ref.read(pitchProvider);
    await flutterTts.setPitch(pitch);


    /// 음성 재생 !!!! 🗣️🗣️
    await flutterTts.speak(text);
  }

  Future<void> _stop() async {
    final flutterTts = ref.read(flutterTtsProvider);
    await flutterTts.stop();
    ref.read(progressProvider.notifier).state = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    final isSpeaking = ref.watch(speakingStateProvider);
    final progress = ref.watch(progressProvider);
    final chaptersState = ref.watch(chaptersProvider);

    final flutterTts = ref.read(flutterTtsProvider);

    return Scaffold(
      appBar: const CustomAppBar(title: 'Chapter', isBack: true, isCenter: true),
      body: Column(
        children: [
          if (isSpeaking)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Stack(
                children: [
                  LinearProgressIndicator(value: progress),
                  Positioned(
                    right: 10,
                    bottom: 4,
                    child: IconButton(
                      icon: const Icon(Icons.stop),
                      onPressed: _stop,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          Expanded(
            child: chaptersState.isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
              itemCount: chaptersState.chapters.length,
              itemBuilder: (context, index) {
                final chapter = chaptersState.chapters[index];
                return ListTile(
                  title: Text(chapter.indonesian),
                  subtitle: Text(chapter.korean),
                  onTap: () => speak(chapter.indonesian),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const TtsControls(),
    );
  }

  @override
  void dispose() {
    final flutterTts = ref.read(flutterTtsProvider);
    flutterTts.stop();
    super.dispose();
  }
}
