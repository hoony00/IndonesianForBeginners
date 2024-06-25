
import 'package:inde/global/common/utils/extension/context_extension.dart';

import 'global/common/data/index/index.dart';
import 'global/config/router/main_router.dart';
import 'global/config/theme/theme.dart';


class App extends ConsumerStatefulWidget {
  const App({super.key});


  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> with  WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = context.deviceWidth;
    double height = context.deviceHeight;

    return ScreenUtilInit(
      designSize: Size(width, height),
      child: MaterialApp.router(
        debugShowMaterialGrid : false,
        debugShowCheckedModeBanner: false,
        showPerformanceOverlay: false,
        theme: buildThemeData(context),
       // theme: FlexThemeData.light(scheme: FlexScheme.blue),
       // themeMode: ThemeMode.system,
        //라우트 상태를 전달해주는 함수
        routeInformationProvider: router.routeInformationProvider,
        // routeInformationParser에서 변환된 값을 어떤 라우트로 보여줄 지 정하는 함수
        routeInformationParser: router.routeInformationParser,
        //URI String을 상태 및 GoRouter에서 사용할 수 있는 형태로 변환해주는 함수
        routerDelegate: router.routerDelegate,
        //  debugShowMaterialGrid: true, -> 그리드로 디자인 보여줌
      ),
    );
  }






}
