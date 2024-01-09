import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/instance_manager.dart';
import 'package:skeleton/core/styles/app_color.dart';
import 'package:skeleton/core/styles/theme/theme_controller/theme_controller.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputAction? textInputAction;
  EmailTextField(
      {Key? key, this.controller, this.hintText, this.textInputAction})
      : super(key: key);
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
          color: themeController.isDarkMode()
              ? AppColor.secondaryTextColor
              : AppColor.primaryTextColor),
      controller: controller,
      textInputAction: textInputAction ?? TextInputAction.next,
      textAlign: TextAlign.start,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: hintText ?? 'Enter email address',
        hintStyle: TextStyle(
          fontSize: 15.sp,
          color: themeController.isDarkMode()
              ? AppColor.secondaryTextColor
              : AppColor.grey50,
        ),
        labelText: 'Email address',
        labelStyle: TextStyle(
          color: themeController.isDarkMode()
              ? AppColor.secondaryTextColor
              : AppColor.primaryTextColor,
          fontSize: 13.sp,
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide(
              color: AppColor.grey30,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide(color: AppColor.primaryColor)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: const BorderSide(
              color: Colors.red,
            )),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide(color: AppColor.grey30)),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide(color: AppColor.grey30)),

        filled: true,
        // contentPadding: const EdgeInsets.all(16),
        fillColor: themeController.isDarkMode()
            ? AppColor.lightContainer
            : AppColor.secondaryTextColor,
      ),
      validator: (controller) {
        if (controller.toString().isEmpty ||
            !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(controller.toString())) {
          return "Please enter your email address";
        } else {
          return null;
        }
      },
    );
  }
}
