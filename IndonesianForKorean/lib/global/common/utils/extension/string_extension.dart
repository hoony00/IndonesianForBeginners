extension StringExt on String {
  // phone
  String get phoneFormat {
    if (length == 11) {
      return "${substring(0, 3)}-${substring(3, 7)}-${substring(7, 11)}";
    } else if (length == 10) {
      return "${substring(0, 3)}-${substring(3, 6)}-${substring(6, 10)}";
    } else {
      return this;
    }
  }

  // Korean Won
  String get koreanWonFormat {
    int value = int.tryParse(replaceAll(',', '')) ?? 0;
    if (value >= 100000000) {
      return "${value ~/ 100000000}억";
    } else if (value >= 10000000) {
      return "${value ~/ 10000000}천${(value % 10000000) ~/ 1000000}백만원";
    } else if (value >= 1000000) {
      return "${value ~/ 1000000}백만원";
    } else if (value >= 10000) {
      return "${value ~/ 10000}만원";
    } else if (value >= 1000) {
      return "${value ~/ 1000}천원";
    } else {
      return "$value원";
    }
  }


  /// 휴대폰 번호 유효성 검사
  bool get isValidPhoneNumber {
    final regex = RegExp(r'^010\d{8}$');
    return regex.hasMatch(this);
  }


  /// 디테일 페이지 버튼
  String determineButtonTitle({
    required bool isMyProduct,
    required bool isBuyer,
    required String status,
  }) {
    if (isMyProduct) {
      switch (status) {
        case '판매 중':
          return '구매 신청 대기중';
        case '구매 중':
          return '판매자 결제 대기중';
        case '거래 진행 중':
          return '오프라인 계약 진행 중';
        case '거래 완료':
          return '거래 완료';
        default:
          return '상태 알 수 없음';
      }
    } else if (isBuyer) {
      switch (status) {
        case '구매 중':
          return '오프라인 계약 진행 중';
        case '거래 진행 중':
          return '구매 신청 완료';
        default:
          return '판매자 결제 대기중';
      }
    } else {
      if (status != '판매 중') {
        return '거래 진행 중';
      }
      return '구매하기';
    }
  }
}
