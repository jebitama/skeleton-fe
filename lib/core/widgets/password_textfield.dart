import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/instance_manager.dart';
import 'package:skeleton/core/styles/app_color.dart';
import 'package:skeleton/core/styles/theme/theme_controller/theme_controller.dart';
import 'package:skeleton/core/utils/constant/app_image.dart';

// ignore: must_be_immutable
class PasswordTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  bool obscureText;
  final TextInputAction? textInputAction;

  PasswordTextField(
      {Key? key,
      this.controller,
      this.hintText,
      required this.obscureText,
      this.textInputAction,
      this.labelText})
      : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
          color: themeController.isDarkMode()
              ? AppColor.primaryTextColor
              : AppColor.primaryTextColor),
      controller: widget.controller,
      obscureText: widget.obscureText,
      obscuringCharacter: '*',
      textInputAction: widget.textInputAction ?? TextInputAction.done,
      textAlign: TextAlign.start,
      keyboardType: TextInputType.text,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
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

        hintText: widget.hintText ?? 'password',
        hintStyle: TextStyle(
          fontSize: 16.sp,
          color: themeController.isDarkMode()
              ? AppColor.secondaryTextColor
              : AppColor.grey50,
        ),
        labelText: widget.labelText ?? 'Password',
        labelStyle: TextStyle(
          color: themeController.isDarkMode()
              ? AppColor.secondaryTextColor
              : AppColor.primaryTextColor,
          fontSize: 13.sp,
          fontWeight: FontWeight.w400,
        ),
        // constraints: BoxConstraints(maxHeight: 56.h,minHeight: 56.h),
        prefixIconConstraints: BoxConstraints(maxHeight: 56.h, minHeight: 56.h),
        suffixIconConstraints: BoxConstraints(maxHeight: 56.h, minHeight: 56.h),

        // suffixIconConstraints: BoxConstraints(maxHeight: 56.h,minHeight: 56.h),
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: 20.h),
          child: InkWell(
            // constraints: BoxConstraints(maxHeight: 56.h, minHeight: 56.h),
            // alignment: Alignment.center,
            onTap: () {
              setState(
                () {
                  widget.obscureText = !widget.obscureText;
                },
              );
            },
            child: widget.obscureText
                ? Image.asset(
                    AppImages.eyeClose,
                    height: 25.h,
                    width: 25.h,
                  )
                : Image.asset(
                    AppImages.eyeOpen,
                    height: 25.h,
                    width: 25.h,
                  ),
          ),
        ),

        filled: true,
        // contentPadding: const EdgeInsets.all(16),
        fillColor: themeController.isDarkMode()
            ? AppColor.lightContainer
            : AppColor.secondaryTextColor,
      ),
      validator: (password) {
        if (password == null || password.isEmpty) {
          return 'Enter Valid Password';
        }
        return null;
      },
    );
  }
}
