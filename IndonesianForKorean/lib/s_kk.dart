/*
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tts/flutter_tts.dart';

final speechRateProvider = StateProvider<double>((ref) => 0.5);
final pitchProvider = StateProvider<double>((ref) => 1.0);
final speakingStateProvider = StateProvider<bool>((ref) => false);
final progressProvider = StateProvider<double>((ref) => 0.0);

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  final FlutterTts flutterTts = FlutterTts();
  String _currentText = '';

  final List<Map<String, String>> greetings = [
    {'indonesian': 'penmanfaatan', 'korean': '문제의 단어'},
    {'indonesian': 'Itu merupakan pengalaman yang paling menggembirakan dalam hidupnya', 'korean': '그것은 그의 인생에서 가장 즐거운 경험이었다.'},
    {'indonesian': 'Partisipasi aktif dalam pemanfaatan dana desa itu harus dimulai dari perencanaan, implementasi hingga ke tahap evaluasi', 'korean': '마을 기금 사용에 대한 적극적인 참여는 기획에서 시작되어 실행, 평가 단계까지 거쳐야 한다.'},
    {'indonesian': 'Partisipasi semua mahasiswa sangat diharapkan untuk dapat menyukseskan program ini.', 'korean': '이 프로그램의 성공을 위해 많은 대학생의 참여를 바랍니다.'},
  ];

  @override
  void initState() {
    super.initState();
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
  }

  Future<void> _speak(String text) async {
    await flutterTts.stop(); // 재생 중인 음성을 중지합니다.
    _currentText = text; // 현재 재생 중인 텍스트를 설정합니다.

    final speechRate = ref.read(speechRateProvider);
    final pitch = ref.read(pitchProvider);

    await flutterTts.setLanguage('id-ID');
    await flutterTts.setPitch(pitch);
    await flutterTts.setSpeechRate(speechRate);
    await flutterTts.speak(text);
  }

  Future<void> _stop() async {
    await flutterTts.stop();
    ref.read(progressProvider.notifier).state = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    final speechRate = ref.watch(speechRateProvider);
    final pitch = ref.watch(pitchProvider);
    final isSpeaking = ref.watch(speakingStateProvider);
    final progress = ref.watch(progressProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('인도네시아어 단어장'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text('말하기 속도:'),
                    Expanded(
                      child: Slider(
                        value: speechRate,
                        min: 0.1,
                        max: 1.0,
                        divisions: 9,
                        label: speechRate.toStringAsFixed(1),
                        onChanged: (value) {
                          ref.read(speechRateProvider.notifier).state = value;
                          if (isSpeaking) {
                            _speak(_currentText); // 현재 재생 중인 텍스트를 재설정
                          }
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text('음성 높이:'),
                    Expanded(
                      child: Slider(
                        value: pitch,
                        min: 0.5,
                        max: 2.0,
                        divisions: 15,
                        label: pitch.toStringAsFixed(1),
                        onChanged: (value) {
                          ref.read(pitchProvider.notifier).state = value;
                          if (isSpeaking) {
                            _speak(_currentText); // 현재 재생 중인 텍스트를 재설정
                          }
                        },
                      ),
                    ),
                  ],
                ),
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
                            icon: Icon(Icons.stop),
                            onPressed: _stop,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: greetings.length,
              itemBuilder: (context, index) {
                final greeting = greetings[index];
                return ListTile(
                  title: Text(greeting['indonesian']!),
                  subtitle: Text(greeting['korean']!),
                  onTap: () => _speak(greeting['indonesian']!),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }
}
*/
