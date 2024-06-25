import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inde/global/components/utill/w_line.dart';

import '../../config/theme/colors/app_color.dart';

/// BigLine

class BigLine extends StatelessWidget {
  const BigLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Line(thickness: 8.h, color: AppColor.hintText.withOpacity(0.2));
  }
}
