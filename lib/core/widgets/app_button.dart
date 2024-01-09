import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton/core/styles/app_color.dart';

class AppButton extends StatelessWidget {
  final String? buttonText;
  final Color? buttonTextColor;
  final double? fontSize;
  final double? hz;
  final double? ve;
  final double? height;
  final Color? color;
  const AppButton({
    super.key,
    this.buttonText,
    this.fontSize,
    this.buttonTextColor,
    this.hz,
    this.ve,
    this.height,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 56.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color ?? AppColor.primaryColor,
        borderRadius: BorderRadius.circular(100.r),
      ),
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: hz ?? 16.h, vertical: ve ?? 16.h),
        child: Text(
          buttonText ?? 'Get Started ',
          style: TextStyle(
            color: buttonTextColor ?? AppColor.primaryTextColor,
            fontSize: fontSize ?? 24.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
