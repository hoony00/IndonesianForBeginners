import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  // 날짜를 'dd/MM/yyyy' 형식으로 포맷한 문자열 반환
  String get formattedDate => DateFormat('dd/MM/yyyy').format(this);

  String get formattedDateKo => DateFormat('yyyy년 MM월 dd일').format(this);

  String get formattedDateSale => DateFormat('MM월 dd일').format(this);

  // 시간을 'HH:mm' 형식으로 포맷한 문자열 반환
  String get formattedTime => DateFormat('HH:mm').format(this);

  // 현재 시간으로부터의 경과 시간을 문자열로 반환
  String get timeAgo {
    final Duration difference = DateTime.now().difference(this);

    if (difference.inMinutes < 1) {
      return '방금 전';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}분 전';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}시간 전';
    } else if (difference.inDays < 30) {
      return '${difference.inDays}일 전';
    } else {
      final int months = (difference.inDays / 30).floor();
      return '$months달 전';
    }
  }

}
