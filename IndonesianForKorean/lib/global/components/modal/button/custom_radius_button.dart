import 'package:flutter/material.dart';

class CustomRadiusButton extends StatelessWidget {
  final Widget buttonChild;
  final double? buttonHeight;
  final Color buttonBackgroundColor;
  final Color? buttonForegroundColor;
  final VoidCallback onButtonPressed;
  final double? borderRadius;
  final TextStyle? textStyle;
  final bool isClickShadow;

  const CustomRadiusButton({
    required this.buttonChild,
    this.buttonHeight,
    required this.buttonBackgroundColor,
    this.buttonForegroundColor,
    required this.onButtonPressed,
    this.borderRadius,
    this.textStyle,
    this.isClickShadow = false,
    super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonHeight ?? 70,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: buttonBackgroundColor,
              foregroundColor: buttonForegroundColor ?? buttonBackgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius?? 15.0),
            ),
            alignment: Alignment.center,
          ).copyWith(
            // 버튼을 눌렀을 때 밑에 그림자 효과 제거 여부
            // true -> 그림자 생김
            // false -> 그림자 안생김
            elevation: isClickShadow ? null : MaterialStateProperty.all<double>(0),
          ),
          onPressed: onButtonPressed,
          child: buttonChild),
    );
  }
}
