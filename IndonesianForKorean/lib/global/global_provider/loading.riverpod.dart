import 'package:flutter_riverpod/flutter_riverpod.dart';
/// 특정 시간만큼 로딩창 띄우기
/// api 시간에 상관없이 커스텀 loding 시간을 설정하고 싶을 때 사용
class LoadingNotifier extends StateNotifier<bool> {
  LoadingNotifier() : super(false);

  void setLoading(int milliseconds) async {
    state = true;
    //await Future.delayed(const Duration(seconds: 1));
    await Future.delayed( Duration(milliseconds: milliseconds));

    state = false;
  }
}

final loadingProvider = StateNotifierProvider<LoadingNotifier, bool>((ref) => LoadingNotifier());
