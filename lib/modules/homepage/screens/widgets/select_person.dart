import 'package:count_stepper/count_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skeleton/core/styles/app_color.dart';
import 'package:skeleton/core/styles/theme/app_theme.dart';
import 'package:skeleton/core/styles/theme/theme_controller/theme_controller.dart';
import 'package:skeleton/core/utils/constant/app_string.dart';
import 'package:skeleton/core/widgets/app_button.dart';
import 'package:skeleton/core/widgets/app_custom_text.dart';
import 'package:skeleton/core/widgets/app_sizebox.dart';
import 'package:skeleton/modules/homepage/controllers/home_controller.dart';

class SelectPerson extends StatefulWidget {
  const SelectPerson({super.key});

  @override
  State<SelectPerson> createState() => _SelectPersonState();
}

class _SelectPersonState extends State<SelectPerson> {
  ThemeController themeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomepageController>(
      builder: (controller) {
        return Container(
          height: 345.h,
          decoration: BoxDecoration(
              color: themeController.isDarkMode()
                  ? AppColor.darkContainer
                  : AppColor.secondaryTextColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(25.r),
                topLeft: Radius.circular(25.r),
              )),
          child: Padding(
            padding: EdgeInsets.only(
                left: 20.h, right: 20.h, top: 24.h, bottom: 40.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CustomText(
                          text: AppText.roomGuest,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w700,
                          textAlign: TextAlign.start,
                          textColor: themeController.isDarkMode()
                              ? AppColor.secondaryTextColor
                              : AppColor.primaryTextColor),
                    ),
                    GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.close,
                          color: themeController.isDarkMode()
                              ? AppColor.secondaryTextColor
                              : AppColor.primaryTextColor,
                          size: 24.h,
                        )),
                  ],
                ),
                AppSpace(
                  height: 24.h,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomText(
                          text: AppText.room,
                          fontSize: 16.h,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.start,
                          textColor: AppTheme.getColorsTheme(context)
                              .textTheme
                              .titleMedium!
                              .color,
                        ),
                      ),
                      CountStepper(
                        defaultValue: 1,
                        max: 9,
                        min: 1,
                        space: 14.h,
                        textStyle: TextStyle(
                            color: AppTheme.getColorsTheme(context)
                                .textTheme
                                .titleMedium!
                                .color,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600),
                        iconDecrement: Container(
                            height: 32.h,
                            width: 32.h,
                            decoration: BoxDecoration(
                              color: AppColor.lightGrey,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Icon(
                              Icons.remove,
                              size: 20.h,
                              color: AppColor.primaryTextColor,
                            )),
                        iconIncrement: Container(
                            height: 32.h,
                            width: 32.h,
                            decoration: BoxDecoration(
                              color: AppColor.lightGrey,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Icon(
                              Icons.add,
                              size: 20.h,
                              color: AppColor.primaryTextColor,
                            )),
                        splashRadius: 20.h,
                        onPressed: (value) {
                          controller.rooms = value;
                          controller.update();
                        },
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: themeController.isDarkMode()
                      ? AppColor.secondaryTextColor
                      : AppColor.grey50,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.h, top: 10.h),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomText(
                          text: AppText.adults,
                          fontSize: 16.h,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.start,
                          textColor: AppTheme.getColorsTheme(context)
                              .textTheme
                              .titleMedium!
                              .color,
                        ),
                      ),
                      CountStepper(
                        defaultValue: 0,
                        max: 9,
                        min: 1,
                        space: 14.h,
                        textStyle: TextStyle(
                            color: AppTheme.getColorsTheme(context)
                                .textTheme
                                .titleMedium!
                                .color,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600),
                        iconDecrement: Container(
                            height: 32.h,
                            width: 32.h,
                            decoration: BoxDecoration(
                              color: AppColor.lightGrey,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Icon(
                              Icons.remove,
                              size: 20.h,
                              color: AppColor.primaryTextColor,
                            )),
                        iconIncrement: Container(
                            height: 32.h,
                            width: 32.h,
                            decoration: BoxDecoration(
                              color: AppColor.lightGrey,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Icon(
                              Icons.add,
                              size: 20.h,
                              color: AppColor.primaryTextColor,
                            )),
                        splashRadius: 20.h,
                        onPressed: (value) {
                          controller.adults = value;
                          controller.update();
                        },
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: themeController.isDarkMode()
                      ? AppColor.secondaryTextColor
                      : AppColor.grey50,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 24.h, top: 10.h),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomText(
                          text: AppText.children,
                          fontSize: 16.h,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.start,
                          textColor: AppTheme.getColorsTheme(context)
                              .textTheme
                              .titleMedium!
                              .color,
                        ),
                      ),
                      CountStepper(
                        defaultValue: 0,
                        max: 9,
                        min: 0,
                        space: 14.h,
                        textStyle: TextStyle(
                            color: AppTheme.getColorsTheme(context)
                                .textTheme
                                .titleMedium!
                                .color,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600),
                        iconDecrement: Container(
                            height: 32.h,
                            width: 32.h,
                            decoration: BoxDecoration(
                              color: AppColor.lightGrey,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Icon(
                              Icons.remove,
                              size: 20.h,
                              color: AppColor.primaryTextColor,
                            )),
                        iconIncrement: Container(
                            height: 32.h,
                            width: 32.h,
                            decoration: BoxDecoration(
                              color: AppColor.lightGrey,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Icon(
                              Icons.add,
                              size: 20.h,
                              color: AppColor.primaryTextColor,
                            )),
                        splashRadius: 20.h,
                        onPressed: (value) {
                          controller.children = value;
                          controller.update();
                        },
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.personSelect = true;
                    controller.update();
                    Get.back();
                  },
                  child: AppButton(
                    fontSize: 18.sp,
                    buttonText: AppText.ok,
                    buttonTextColor: AppColor.secondaryTextColor,
                  ),
                ),
              ],
            ),
          ),
        );
      },
      init: HomepageController(),
    );
  }
}
