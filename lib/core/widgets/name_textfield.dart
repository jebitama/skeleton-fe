import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/instance_manager.dart';
import 'package:skeleton/core/styles/app_color.dart';
import 'package:skeleton/core/styles/theme/theme_controller/theme_controller.dart';

class NameTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final String? validatorError;

  // void Function()? onTap;

  NameTextField(
      {Key? key,
      this.controller,
      this.hintText,
      this.validatorError,
      this.labelText})
      : super(key: key);

  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color: themeController.isDarkMode()
            ? AppColor.secondaryTextColor
            : AppColor.primaryTextColor,
      ),
      controller: controller,
      textInputAction: TextInputAction.next,
      textAlign: TextAlign.start,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        hintText: hintText ?? 'First name',
        hintStyle: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w400,
            color: themeController.isDarkMode()
                ? AppColor.secondaryTextColor
                : AppColor.grey50),
        labelText: labelText ?? 'First name',
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
            !RegExp(r"^[a-zA-Z]").hasMatch(controller.toString())) {
          return validatorError ?? "Please enter your Last Name";
        } else {
          return null;
        }
      },
    );
  }
}
