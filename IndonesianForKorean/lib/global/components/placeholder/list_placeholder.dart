import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'placeholders.dart';

class ListPlaceholder extends StatelessWidget {
  const ListPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children:  [
        const ShimmerFromColors(
          child: ListContentPlaceholder(
            lineType: ContentLineType.twoLines,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        const ShimmerFromColors(
          child: ListContentPlaceholder(
            lineType: ContentLineType.threeLines,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        const ShimmerFromColors(
          child: ListContentPlaceholder(
            lineType: ContentLineType.twoLines,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        const ShimmerFromColors(
          child: ListContentPlaceholder(
            lineType: ContentLineType.threeLines,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        const ShimmerFromColors(
          child: ListContentPlaceholder(
            lineType: ContentLineType.twoLines,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        const ShimmerFromColors(
          child: ListContentPlaceholder(
            lineType: ContentLineType.threeLines,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        const ShimmerFromColors(
          child: ListContentPlaceholder(
            lineType: ContentLineType.threeLines,
          ),
        ),
      ],
    );
  }
}
