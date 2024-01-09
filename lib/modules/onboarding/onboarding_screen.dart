import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skeleton/core/styles/app_color.dart';

class OnboardingScreen extends StatelessWidget {
  final String? image;
  final String? title;
  final String? disc;
  // final int? index;
  const OnboardingScreen({Key? key, this.image, this.title, this.disc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: Image.asset(
          image ?? 'assets/images/orangegroupe.png',
        ).marginSymmetric(horizontal: 20.h)),
        SizedBox(
          height: 20.h,
        ),
        Text(
          title ?? 'Choose your favorite food',
          style: TextStyle(
            color: AppColor.primaryTextColor,
            fontSize: 28.sp,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.end,
        ),
        SizedBox(
          height: 16.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Text(
            disc ??
                'Amet minim mollit non deserunt '
                    'ullamco est sit aliqua dolor do amet sint.',
            style: TextStyle(
              color: AppColor.primaryTextColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
            maxLines: 3,
          ),
        ),
      ],
    );
  }
}
