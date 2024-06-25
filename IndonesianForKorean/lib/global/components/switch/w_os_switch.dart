import 'dart:io'; // OS 판별을 위해 필요한 라이브러리
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../config/theme/colors/app_color.dart'; // iOS 스타일 위젯

// OS에 맞춘 스위치를 나타내는 StatelessWidget
class OsSwitch extends StatelessWidget {
  final bool value; // 스위치의 현재 상태
  final double scaleX; // 스위치의 크기 비율
  final ValueChanged<bool> onChanged; // 스위치 상태 변경 콜백

  const OsSwitch({
    required this.value,
    required this.onChanged,
    this.scaleX = 1,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Transform.scale(
        scale: scaleX,
        child: CupertinoSwitch(
          value: value,
          onChanged: onChanged,
          activeColor: AppColor.primary, // iOS 활성 색상
        ))
        : Switch(
      value: value,
      onChanged: onChanged,
      activeColor: AppColor.primary, // Android 활성 색상
    );
  }
}
