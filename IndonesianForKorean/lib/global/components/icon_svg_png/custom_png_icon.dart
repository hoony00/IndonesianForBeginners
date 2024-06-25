
import 'package:flutter/material.dart';

class CustomPngIcon extends StatelessWidget {

  final String fileDirectory;
  final String fileName;
  final BoxFit fit;
  final double? width;
  final double? height;
  final Color? color;

  const CustomPngIcon({
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
      child: Image.asset(
        "assets/images/png/$fileDirectory/$fileName.png",
        fit: fit,
        width: width,
        height: height,
      ),
    );
  }
}
