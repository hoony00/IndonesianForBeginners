
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSvgIcon extends StatelessWidget {

  final String fileDirectory;
  final String fileName;
  final BoxFit fit;
  final double? width;
  final double? height;
  final Color? color;

  const CustomSvgIcon({
    required this.fileDirectory,
    required this.fileName,
    this.fit = BoxFit.contain,
    this.width,
    this.height,
    this.color,
    super.key});

  //CustomSvgIcon

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      child: SvgPicture.asset(
        "assets/images/svg/$fileDirectory/$fileName.svg",
        fit: fit,
        width: width,
        height: height,
      ),
    );
  }
}
