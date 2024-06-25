import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inde/domain/screen/content/s_content.dart';
import 'package:inde/domain/screen/chapter/s_select_chap.dart';
import 'package:inde/domain/screen/senario/s_scenario.dart';

import 'package:inde/global/global_provider/page_index_provider.dart';

import '../../../global/components/app_bar/custom_app_bar.dart';
import '../../model/enum/view_enum.dart';

/// 선택된 시나리오
final selectedScenarioProvider = StateProvider<String?>((ref) => null);

/// 선택된 챕터
final selectedChapterProvider = StateProvider<String?>((ref) => null);

class MainScreen extends ConsumerWidget {
   MainScreen({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedScenario = ref.watch(selectedScenarioProvider);
    final selectedChapter = ref.watch(selectedChapterProvider);

    final pageIndex = ref.watch(pageIndexProvider);

    return PopScope(
      canPop: false,
      child: Scaffold(
        body: IndexedStack(
          index: pageIndex,
          children:  [
            ScenarioSelectionScreen(),
            ChapterSelectionScreen(),
          const ContentScreen(),
          ],
        ),
      ),
    );

    }
  }


