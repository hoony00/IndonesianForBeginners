import 'package:dio/dio.dart';

import '../common/data/constants.dart';
import '../common/data/index/index.dart';
import '../common/utils/exception/exception.dart';
/// 해당 객체들을 싱글톤으로 관리하기 위해 사용

final appServicesProvider = Provider<AppServices>((ref) {
  return AppServices();
});



class AppServices {
  static final AppServices _instance = AppServices._internal();

  factory AppServices() {
    return _instance;
  }

  AppServices._internal();

  final ExceptionDio exceptionDio = ExceptionDio();
  final Dio dio = Dio();
}
