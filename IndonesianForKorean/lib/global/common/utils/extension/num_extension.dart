import 'package:easy_localization/easy_localization.dart';

final decimalFormat = NumberFormat.decimalPattern("en");

extension IntExt on int {
  static int? safeParse(String? source) {
    if (source == null) return null;
    return int.tryParse(source);
  }

  String toComma() {
    return decimalFormat.format(this);
  }

  String get withPlusMinus {
    if (this > 0) {
      return "+$this";
    } else if (this < 0) {
      return "$this";
    } else {
      return "0";
    }
  }

  String toCurrency() {
    if (this >= 100000000) {
      int hundredMillions = this ~/ 100000000;
      int remaining = this % 100000000;
      if (remaining == 0) {
        return '$hundredMillions억';
      } else {
        return '$hundredMillions억 ${remaining.toCurrency()}';
      }
    } else if (this >= 10000) {
      int tenThousands = this ~/ 10000;
      int remaining = this % 10000;
      if (remaining == 0) {
        return '${tenThousands.toComma()}만 원';
      } else {
        return '${tenThousands.toComma()}만 ${remaining.toCurrency()}';
      }
    } else {
      return '${toComma()} 원';
    }
  }
}

extension DoubleExt on double {
  String toComma() {
    return decimalFormat.format(this);
  }
}
