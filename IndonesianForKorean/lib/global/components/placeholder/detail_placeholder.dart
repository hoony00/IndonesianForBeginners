import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'placeholders.dart';

class DetailPlaceholder extends StatelessWidget {
  const DetailPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ListView(
      shrinkWrap: true,
      children:   [
        /// 이미지
        const ShimmerFromColors(
          child: CarouselPlaceholder(),
        ),
        SizedBox(
          height: 30.h,
        ),
        ShimmerFromColors(
          child: DetailLinePlaceholder(rightMargin: 280,),
        ),
        SizedBox(
          height: 30.h,
        ),
        ShimmerFromColors(
          child: DetailLinePlaceholder(rightMargin: 200,),
        ),
        SizedBox(
          height: 30.h,
        ),
        ShimmerFromColors(
          child: DetailLinePlaceholder(rightMargin: 30.w,),
        ),
        SizedBox(
          height: 80.h,
        ),
        const ShimmerFromColors(
          child: BannerPlaceholder(),
        ),
        SizedBox(
          height: 30.h,
        ),

        ShimmerFromColors(
          child: DetailLinePlaceholder(rightMargin: 30.w,),
        ),
        SizedBox(
          height: 20.h,
        ),
        ShimmerFromColors(
          child: DetailLinePlaceholder(rightMargin: 200.w,),
        ),
      ],
    );
  }
}
