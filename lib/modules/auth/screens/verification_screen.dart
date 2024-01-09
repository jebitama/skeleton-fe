import 'package:flutter/material.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skeleton/core/routes/common_method.dart';
import 'package:skeleton/core/routes/route_path.dart';
import 'package:skeleton/core/styles/app_color.dart';
import 'package:skeleton/core/styles/theme/theme_controller/theme_controller.dart';
import 'package:skeleton/core/utils/constant/app_string.dart';
import 'package:skeleton/core/widgets/app_button.dart';
import 'package:skeleton/core/widgets/app_custom_text.dart';
import 'package:skeleton/core/widgets/app_sizebox.dart';
import 'package:skeleton/modules/auth/controllers/forgotpass_controller.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  ForgotPassController forgotPassController = Get.find();
  final ThemeController themeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 15.h, bottom: 35.h),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          CommonMethod.popScreen(context, Routes.forgotPass);
                        },
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 20.h,
                          color: themeController.isDarkMode()
                              ? AppColor.secondaryTextColor
                              : AppColor.primaryTextColor,
                        )),
                    AppSpace(
                      width: 16.h,
                    ),
                    CustomText(
                      text: AppText.verification,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w700,
                      textColor: themeController.isDarkMode()
                          ? AppColor.secondaryTextColor
                          : AppColor.primaryTextColor,
                    )
                  ],
                ),
              ),
              CustomText(
                text: AppText.enterCode,
                textColor: themeController.isDarkMode()
                    ? AppColor.secondaryTextColor
                    : AppColor.primaryTextColor,
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                textAlign: TextAlign.start,
              ),
              CustomText(
                text: forgotPassController.forgotEmailController.text,
                textColor: themeController.isDarkMode()
                    ? AppColor.secondaryTextColor
                    : AppColor.primaryTextColor,
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                textAlign: TextAlign.start,
              ),
              AppSpace(
                height: 34.h,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 48.h),
                child: PinCodeFields(
                  length: 6,
                  fieldBorderStyle: FieldBorderStyle.square,
                  responsive: true,
                  fieldHeight: 50.h,
                  fieldWidth: 60.h,
                  obscureText: true,

                  activeBorderColor: themeController.isDarkMode()
                      ? AppColor.primaryTextColor
                      : AppColor.grey30,
                  activeBackgroundColor: themeController.isDarkMode()
                      ? AppColor.grey30
                      : AppColor.secondaryTextColor,
                  borderColor: themeController.isDarkMode()
                      ? AppColor.primaryTextColor
                      : AppColor.grey30,
                  borderRadius: BorderRadius.circular(15.0),
                  keyboardType: TextInputType.number,
                  // inputFormatters: FilteringTextInputFormatter.digitsOnly,
                  autoHideKeyboard: false,
                  fieldBackgroundColor: themeController.isDarkMode()
                      ? AppColor.lightContainer
                      : AppColor.secondaryTextColor,
                  // borderColor: Colors.blue,
                  textStyle: TextStyle(
                    color: themeController.isDarkMode()
                        ? AppColor.secondaryTextColor
                        : AppColor.primaryTextColor,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  onComplete: (text) {},
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 48.h),
                child: Align(
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(
                      text: AppText.doNotGet,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                        color: themeController.isDarkMode()
                            ? AppColor.secondaryTextColor
                            : AppColor.primaryTextColor,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: AppText.resetOtp,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp,
                                color: AppColor.primaryColor)),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  CommonMethod.sendToNextScreen(context, Routes.resetPass);
                },
                child: AppButton(
                  buttonTextColor: AppColor.secondaryTextColor,
                  buttonText: AppText.verify,
                  fontSize: 18.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
