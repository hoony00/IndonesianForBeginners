
import '../../common/data/index/index.dart';
import '../../config/theme/font/pretendard.dart';

class MainTitle extends StatelessWidget {
  final String title;
  final double fontSize; // 선택적으로 받을 폰트 크기 변수 추가
  const MainTitle({super.key, required this.title, this.fontSize = 24}); // 폰트 크기 기본값 설정

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Pretendard.wblack_s24_w700.copyWith(fontSize: fontSize.sp), // fontSize를 사용자가 지정한 값 또는 기본값으로 설정
    ).pOnly(left: 23.w);
  }
}
