import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../global/common/data/index/index.dart';
import '../../../global/components/icon_svg_png/custom_png_icon.dart';
import '../../../global/components/icon_svg_png/custom_svg_icon.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {


  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomPngIcon(
                fileDirectory: 'logo',
                fileName: 'fku',
                color: AppColor.primary,
                width: 150.w,
                height: 150.h,
              ),
              SpinKitThreeBounce(
                color: AppColor.primary,
                size: 25.w,
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}
