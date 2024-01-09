import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skeleton/core/generated/assets.dart';
import 'package:skeleton/core/styles/app_color.dart';
import 'package:skeleton/core/styles/theme/theme_controller/theme_controller.dart';

class SelectDataTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final String? icon;
  final TextInputType? keyboardType;
  final TextInputAction? inputAction;
  final String? validatorError;
  final bool? enabled;

  SelectDataTextField(
      {Key? key,
      this.controller,
      this.hintText,
      this.validatorError,
      this.labelText,
      this.icon,
      this.keyboardType,
      this.inputAction,
      this.enabled})
      : super(key: key);
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: TextFormField(
        style: TextStyle(
          color: themeController.isDarkMode()
              ? AppColor.secondaryTextColor
              : AppColor.primaryTextColor,
        ),
        enabled: enabled ?? true,
        controller: controller,
        textInputAction: inputAction ?? TextInputAction.next,
        textAlign: TextAlign.start,
        keyboardType: keyboardType ?? TextInputType.name,
        decoration: InputDecoration(
            hintText: hintText ?? 'From',
            hintStyle: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: themeController.isDarkMode()
                  ? AppColor.secondaryTextColor
                  : AppColor.grey50,
            ),

            // labelText: labelText??'From',

            // labelStyle: TextStyle(
            //   color: themeController.isDarkMode()?AppColor.secondaryTextColor:AppColor.primaryTextColor,
            //   fontSize: 16.sp,
            //   fontWeight: FontWeight.w400,
            // ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18.r),
                borderSide: BorderSide(
                  color: AppColor.grey30,
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18.r),
                borderSide: BorderSide(color: AppColor.primaryColor)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18.r),
                borderSide: const BorderSide(
                  color: Colors.red,
                )),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18.r),
                borderSide: BorderSide(color: AppColor.grey30)),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide(color: AppColor.grey30)),
            filled: true,
            // contentPadding: const EdgeInsets.all(16),
            fillColor: themeController.isDarkMode()
                ? AppColor.lightContainer
                : AppColor.secondaryTextColor,
            prefixIcon: Padding(
              padding: EdgeInsets.all(16.h),
              child: Image.asset(
                icon ?? Assets.iconIconfrom,
                height: 24.h,
                width: 24.h,
              ),
            )),
      ),
    );
  }
}
