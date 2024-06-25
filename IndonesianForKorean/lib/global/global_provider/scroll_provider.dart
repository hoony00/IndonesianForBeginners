import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
/// todo : 피드백 파일에 주석 가져와서 넣기

class ScrollNotifier extends StateNotifier<bool> {
  Timer? _scrollTimer;

  ScrollNotifier() : super(false);

  void setScrolling(bool isScrolling) {
    if (isScrolling) {
      state = true;
      _scrollTimer?.cancel(); // 기존 타이머 취소
      _scrollTimer = Timer(const Duration(milliseconds: 100), () {
        state = false;
      });
    } else {
      state = false;
    }
  }

  @override
  void dispose() {
    _scrollTimer?.cancel();
    super.dispose();
  }
}

final scrollProvider = StateNotifierProvider<ScrollNotifier, bool>((ref) => ScrollNotifier());
