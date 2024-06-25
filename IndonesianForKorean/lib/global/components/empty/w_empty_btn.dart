import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomEmptyBtn extends StatelessWidget {
  final String title;
  final double fontSize;
  final Function onMyPressed;

  // minimumSize 동적 분배
  final double width;
  final double height;

  const CustomEmptyBtn(
      {Key? key,
      required this.title,
      required this.fontSize,
      required this.onMyPressed,
      required this.width,
      this.height = 50})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onMyPressed(),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 0.4,
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
          ),
        ).pSymmetric(h: 40.w, v: 10.h),
      ),
    );
  }
}
