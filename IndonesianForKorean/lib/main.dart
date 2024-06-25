import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'app.dart';
import 'global/common/data/index/index.dart';
import 'global/config/router/main_router.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // Flutter에서 첫 프레임을 렌더링한 후에도 네이티브 스플래시 화면을 유지합니다.
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // 애플리케이션 실행
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );

  // 로그인 상태 체크
 // checkLoginStatus();
  checkVersion();
  // 네이티브 스플래시 화면 제거
  FlutterNativeSplash.remove();
}

Future<void> checkLoginStatus() async {
  await Future.delayed(const Duration(seconds: 1));
  router.go('/');
}


checkVersion() async {
  debugPrint('🚀Start Doctor-Market︎ 🚀');
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  final String currentOS = Platform.isIOS ? 'iOS' : 'Android';
  debugPrint('⚡️version : [${packageInfo.version}] || os : [$currentOS]⚡️ ');
}