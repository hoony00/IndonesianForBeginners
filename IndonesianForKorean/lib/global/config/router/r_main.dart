import 'package:go_router/go_router.dart';
import '../../../domain/screen/main/s_main.dart';
import '../../../domain/screen/start/s_splash.dart';

final List<GoRoute> mainRoutes = [
  GoRoute(
    path: '/splash',
    builder: (context, state) => const SplashScreen(),
  ),
  GoRoute(
    path: '/main',
  //  builder: (context, state) => const WelcomeScreen(),
    builder: (context, state) =>  MainScreen(),
  ),
/*  GoRoute(
    name: 'main',
    path: '/',
    builder: (context, state) => const MainScreen(),
    routes: [
      GoRoute(
        path: 'notificationScreen', // 여기에서 경로명을 소문자로 변경
        builder: (context, state) => const NotificationScreen(),
      ),
      GoRoute(
        path: 'searchScreen', // 경로명 소문자로 일관성 유지
        builder: (context, state) => const NotificationScreen(),
      ),
    ],
  ),*/
];
