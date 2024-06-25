import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Text/w_title.dart';
import '../utill/w_height_and_width.dart';
import '../utill/w_image_shadow.dart';

class ServerErrorWidget extends StatelessWidget {
  final String message;

  const ServerErrorWidget({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Height(160.h),
        ImageShadow(
          sigma: 3,
          offset: const Offset(1, 3.5),
          child: Icon(
            Icons.error_outline,
            size: 50.sp,)
        ),
        Height(50.h),
        MainTitle(title: '네트워크 점검 중입니다.', fontSize: 25.sp),
        Height(10.h),
        Text(message,
            style: TextStyle(fontSize: 16.sp), textAlign: TextAlign.center),
        Height(30.h),
      ],
    );
  }
}
