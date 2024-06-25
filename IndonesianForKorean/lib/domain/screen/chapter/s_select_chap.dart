import 'package:inde/domain/provider/chapter.riverpod.dart';
import 'package:inde/domain/screen/main/s_main.dart';
import 'package:inde/global/global_provider/page_index_provider.dart';

import '../../../global/common/data/index/index.dart';
import '../../../global/components/app_bar/custom_app_bar.dart';

class ChapterSelectionScreen extends ConsumerWidget {

  ChapterSelectionScreen({super.key});

  final chapters = [
    {'key': 'beginner', 'title': '초급 단어'},
    {'key': 'intermediate', 'title': '중급 단어'},
    {'key': 'advanced', 'title': '고급 단어'},
    {'key': 'basic_sentences', 'title': '기본 문장'},
    {'key': 'advanced_sentences', 'title': '고급 문장'}
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Scenario', isBack: true, isCenter: true),
      body: ListView.builder(
        itemCount: chapters.length,
        itemBuilder: (context, index) {
          final chapter = chapters[index];
          return ListTile(
            title: Text(chapter['title']!),
            onTap: () {
              ref.read(selectedChapterProvider.notifier).update((value) => chapter['key']!);
              ref.read(pageIndexProvider.notifier).update((value) => 2);
              ref.read(chaptersProvider.notifier).loadChapters();
            },
          );
        },
      ),
    );
  }
}
