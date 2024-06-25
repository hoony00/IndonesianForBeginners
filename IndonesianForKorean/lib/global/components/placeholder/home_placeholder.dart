import 'package:flutter/material.dart';
import 'package:inde/global/common/data/index/index.dart';

import 'placeholders.dart';

class HomePlaceholder extends StatelessWidget {
  const HomePlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShimmerFromColors(
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            const ContentPlaceholder().pOnly(left: 15.w),
            const ContentPlaceholder(),
            const ContentPlaceholder(),
          ],
        ),
      ),
    );
  }
}
