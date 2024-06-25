import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:inde/domain/screen/main/s_main.dart';

import '../../global/common/data/index/index.dart';
import '../model/chapter.dart';
import 'chat.state.dart';

final chaptersProvider = StateNotifierProvider<ChaptersNotifier, ChaptersState>(
      (ref) => ChaptersNotifier(ref),
);

class ChaptersNotifier extends StateNotifier<ChaptersState> {
  ChaptersNotifier(this._ref) : super(ChaptersState.initial());

  final Ref _ref;

  Future<void> loadChapters() async {

    debugPrint('🎁 내용 불러오는 중');

    state = state.copyWith(isLoading: true);
    try {
      final chapters = await fetchChapters(); // Fetch chapters from your data source
      state = state.copyWith(isLoading: false, chapters: chapters);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<List<Chapter>> loadChaptersJson(String scenario, String chapter) async {
    final String response = await rootBundle.loadString('assets/json/$scenario.json');
    final Map<String, dynamic> data = json.decode(response);
    final List<dynamic> chaptersJson = data[chapter];
    return chaptersJson.map((json) => Chapter.fromJson(json)).toList();
  }

  Future<List<Chapter>> fetchChapters() async {
    final scenario = _ref.read(selectedScenarioProvider) ?? '';
    final chapter = _ref.read(selectedChapterProvider) ?? '';
 return  await  loadChaptersJson(scenario, chapter);

  }
}