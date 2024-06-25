
import '../../common/data/index/index.dart';
import '../../config/theme/font/chab.dart';


class WaterMarkWidget extends StatelessWidget {
  const WaterMarkWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      width: 1.sw,
      child: const Opacity(
        opacity: 0.5,
        child: Text(
                "IndoKorea Speak",
                style: Chab.whintText_s18_w400,
                textAlign: TextAlign.center,
              ),
      ),
    );
  }
}
