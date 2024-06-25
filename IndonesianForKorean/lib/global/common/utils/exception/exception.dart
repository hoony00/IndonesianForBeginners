import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ExceptionDio {
  // Dio 에러 처리 함수
  Future<void> handleDioError(Exception e, String action) async {
    if (e is DioException) {
      if (e.response?.statusCode == 401) {
        debugPrint("‼️ handleDioError- DioError: $action, 401 => 유효하지 않은 AccessToken ⚔️");
        return;
      } else {
        debugPrint("‼️ handleDioError 에러 api: $action");
      }

      switch (e.type) {
        case DioExceptionType.badResponse:
          debugPrint("잘못된 요청: ${e.message ?? '메시지 없음'}");
          break;
        case DioExceptionType.badCertificate:
          debugPrint("잘못된 인증서: ${e.message ?? '메시지 없음'}");
          break;
        case DioExceptionType.sendTimeout:
          debugPrint("요청 시간 초과: ${e.message ?? '메시지 없음'}");
          break;
        case DioExceptionType.receiveTimeout:
          debugPrint("receiveTimeout: ${e.message ?? '메시지 없음'}");
          break;
        case DioExceptionType.connectionError:
          debugPrint("연결 오류: ${e.message ?? '메시지 없음'}");
          break;
        case DioExceptionType.connectionTimeout:
          debugPrint("connectionTimeout: ${e.message ?? '메시지 없음'}");
          break;
        case DioExceptionType.cancel:
          debugPrint("요청 취소: ${e.message ?? '메시지 없음'}");
          break;
        case DioExceptionType.unknown:
          debugPrint("알 수 없는 오류: ${e.message ?? '메시지 없음'}");
          break;
      }
    } else {
      debugPrint("일반 예외 발생: $action, 오류: $e");
    }
  }

  // HTTP 응답 코드 처리 함수
  Future<void> handleHttpResponseCode(Response response, String apiName) async {
    int statusCode = response.statusCode!;
    switch (statusCode) {
      case 200:
        debugPrint('✅ http요청, $apiName✅');
        break;
      case 400:
        debugPrint("$apiName 400 요청 오류: $statusCode");
        break;
      case 401:
        debugPrint("$apiName 인증 실패: $statusCode");
        break;
      case 500:
        debugPrint("$apiName 서버 오류: $statusCode");
        break;
      default:
        debugPrint("$apiName 알 수 없는 오류: $statusCode");
    }
  }
}
