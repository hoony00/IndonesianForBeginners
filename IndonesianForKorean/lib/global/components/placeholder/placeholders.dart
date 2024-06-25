import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../utill/w_height_and_width.dart';

class CarouselPlaceholder extends StatelessWidget {
  const CarouselPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 350 / 250,
      child: Container(
        color: Colors.white,
      ),
    );
  }
}

/// 큰 배너, 이후 광고나 디자인 변경시 사용
class BannerPlaceholder extends StatelessWidget {
  const BannerPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 390 / 100,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16.0),
      ),
    );
  }
}

enum ContentLineType {
  twoLines,
  threeLines,
}

/// 메인 홀더
class ContentPlaceholder extends StatelessWidget {

  const ContentPlaceholder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10.w, 20.h, 0.h, 10.h),
      child:   Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
            ),
            width: 120.w,
            height: 120.h,
          ),
          SizedBox(height: 10.h),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
            ),
            width: 110.w,
            height: 10.h,
          ).pOnly(left: 3.w),
          SizedBox(height: 10.h),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
            ),
            width: 70.w,
            height: 10.h,
          ).pOnly(left: 3.w),
        ],
      ),
    );
  }
}

/// 메인 홀더
class ListContentPlaceholder extends StatelessWidget {
  final ContentLineType lineType;

  const ListContentPlaceholder({
    Key? key,
    required this.lineType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.0.w),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
            ),
            width: 100.w,
            height: 92.h,
          ),
          SizedBox(width: 12.0.w),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: 10.h,
                  margin:  EdgeInsets.only(bottom: 8.0.h),
                ),
                if (lineType == ContentLineType.threeLines)
                  Container(color: Colors.white, width: 180.0.w, height: 10.0.h).pOnly(bottom: 8.0.h),
                Container(color: Colors.white, width: 130.0.w, height: 10.0.h),

              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DetailLinePlaceholder extends StatelessWidget {
  const DetailLinePlaceholder({Key? key, required this.rightMargin})
      : super(key: key);
  final double rightMargin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Container(
        color: Colors.white,
        height: 10.0.h,
        margin: EdgeInsets.only(right: rightMargin.w),
      ),
    );
  }
}

class ShimmerFromColors extends StatelessWidget {
  final Widget child;

  const ShimmerFromColors({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: child,
    );
  }
}
