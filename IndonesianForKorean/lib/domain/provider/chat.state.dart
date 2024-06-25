import '../model/chapter.dart';

class ChaptersState {
  final bool isLoading;
  final List<Chapter> chapters;
  final String error;

  ChaptersState({
    required this.isLoading,
    required this.chapters,
    required this.error,
  });

  factory ChaptersState.initial() {
    return ChaptersState(isLoading: false, chapters: [], error: '');
  }

  ChaptersState copyWith({
    bool? isLoading,
    List<Chapter>? chapters,
    String? error,
  }) {
    return ChaptersState(
      isLoading: isLoading ?? this.isLoading,
      chapters: chapters ?? this.chapters,
      error: error ?? this.error,
    );
  }
}