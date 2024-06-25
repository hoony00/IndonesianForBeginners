import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/theme/colors/app_color.dart';


extension SnackbarContextExtension on BuildContext {
  /// Scaffold안에 Snackbar를 보여줍니다.
  void showSnackbar(String message, {Widget? extraButton}) {
    _showSnackBarWithContext(
      this,
      _SnackbarFactory.createSnackBar(this, message, extraButton: extraButton),
    );
  }

  /// Scaffold안에 빨간 Snackbar를 보여줍니다.
  void showErrorSnackbar(
      String message, {
        Color bgColor = AppColor.salmon,
        double bottomMargin = 0,
      }) {
    _showSnackBarWithContext(
      this,
      _SnackbarFactory.createErrorSnackBar(
        this,
        message,
        bgColor: bgColor,
        bottomMargin: bottomMargin,
      ),
    );
  }
}

void _showSnackBarWithContext(BuildContext context, Widget snackbar) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      behavior: SnackBarBehavior.fixed,
      content: snackbar, // 커스텀 스낵바 위젯 사용
    ),
  );
}

class _SnackbarFactory {
  static Widget createSnackBar(BuildContext context, String message,
      {Color? bgColor, Widget? extraButton}) {
    Color snackbarBgColor = bgColor ?? AppColor.primary;

    // AnimationController를 사용하여 애니메이션을 제어
    final animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: ScaffoldMessenger.of(context),
    );

    // ScaleTransition을 사용하여 스낵바가 점점 커지면서 나타나는 애니메이션 추가
    return ScaleTransition(
      scale: CurvedAnimation(
        parent: animationController..forward(),
        curve: Curves.easeOut,
      ),
      child: GestureDetector(
        // 스낵바를 터치하여 숨길 수 있도록 GestureDetector 사용
        onTap: () {
          try {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          } catch (e) {
            // do nothing
          }
        },
        child: Container(
          decoration: BoxDecoration(
            color: snackbarBgColor,
            borderRadius: BorderRadius.circular(5),
          ),
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Expanded(
                child: Text(message,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              if (extraButton != null) extraButton, // 추가 버튼이 있으면 표시
            ],
          ),
        ),
      ),
    );
  }

  static Widget createErrorSnackBar(BuildContext context, String? message,
      {Color bgColor = AppColor.salmon, double bottomMargin = 0}) {
    // AnimationController를 사용하여 애니메이션을 제어
    final animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: ScaffoldMessenger.of(context),
    );

    // ScaleTransition을 사용하여 스낵바가 점점 커지면서 나타나는 애니메이션 추가
    return ScaleTransition(
      scale: CurvedAnimation(
        parent: animationController..forward(),
        curve: Curves.easeOut,
      ),
      child: GestureDetector(
        // 스낵바를 터치하여 숨길 수 있도록 GestureDetector 사용
        onTap: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
        child: Container(
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(5),
          ),
          padding: const EdgeInsets.all(20),
          margin: EdgeInsets.only(bottom: bottomMargin),
          child: Text("$message",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontStyle: FontStyle.normal,
              )),
        ),
      ),
    );
  }
}
