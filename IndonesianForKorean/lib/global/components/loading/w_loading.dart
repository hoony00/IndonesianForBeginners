import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../config/theme/colors/app_color.dart';


class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, this.isLoading = true});
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return  Visibility(
      visible: isLoading,
      child: Center(
        child:SpinKitThreeBounce(
          color:AppColor.primary,
          size: 25.0.sp,
        ), //
      ),
    );
  }
}
