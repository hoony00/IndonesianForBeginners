
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:inde/global/common/data/index/index.dart';


class LoadingContainer extends StatelessWidget {
  final Color? color; // 선택적으로 받음
  final Color? bounceColor; // 선택적으로 받음
  final bool isVisible;

  const LoadingContainer({
    Key? key,
    this.color = AppColor.white, // 기본값으로 흰색 설정
    this.bounceColor = AppColor.primary, // 기본값으로 흰색 설정
    this.isVisible = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Container(
        color: color!.withOpacity(0.4), // 배경색 설정
        child: Center(
          child: SpinKitCircle(
            color: bounceColor,
            size: 25.h,
          ).pOnly(top: 100.h),
        ),
      ),
    );
  }
}
