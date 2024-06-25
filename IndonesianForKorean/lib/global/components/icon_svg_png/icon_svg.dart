import 'package:flutter_svg/flutter_svg.dart';


import '../../common/data/index/index.dart';

class IconSvg extends StatelessWidget {
  final String fileName;
  final BoxFit boxFit;
  final Color backGroundColor;
  final double svgWidth;
  final double svgHeight;


  const IconSvg({
    required this.fileName,
    required this.svgWidth,
    required this.svgHeight,
    this.boxFit = BoxFit.cover,
    this.backGroundColor = AppColor.white,
    super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        color: backGroundColor,
        alignment: Alignment.center,
        child: SvgPicture.asset(
          "assets/icon/$fileName.svg",
          fit: boxFit,
          width: svgWidth,
          height: svgHeight,
        ),
      ),
    );
  }
}
