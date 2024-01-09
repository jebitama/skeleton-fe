import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:skeleton/core/routes/common_method.dart';
import 'package:skeleton/core/routes/route_path.dart';
import 'package:skeleton/core/styles/app_color.dart';
import 'package:skeleton/core/styles/theme/theme_controller/theme_controller.dart';
import 'package:skeleton/core/utils/constant/app_string.dart';
import 'package:skeleton/core/widgets/app_button.dart';
import 'package:skeleton/core/widgets/app_custom_text.dart';
import 'package:skeleton/core/widgets/app_sizebox.dart';
import 'package:skeleton/core/widgets/email_textfield.dart';
import 'package:skeleton/modules/auth/controllers/forgotpass_controller.dart';

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({super.key});

  @override
  State<ForgotPassScreen> createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  ForgotPassController forgotPassController = Get.put(ForgotPassController());
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Form(
            key: forgotPassController.forgotKey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 15.h, bottom: 35.h),
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            CommonMethod.popScreen(context, Routes.authLogin);
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
                        text: AppText.forgot,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w700,
                        textColor: themeController.isDarkMode()
                            ? AppColor.secondaryTextColor
                            : AppColor.primaryTextColor,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 34.h),
                  child: CustomText(
                    text: AppText.forgotInstruction,
                    textColor: themeController.isDarkMode()
                        ? AppColor.secondaryTextColor
                        : AppColor.primaryTextColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    textAlign: TextAlign.start,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 48.h),
                  child: EmailTextField(
                    controller: forgotPassController.forgotEmailController,
                    textInputAction: TextInputAction.done,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (forgotPassController.forgotKey.currentState!
                        .validate()) {
                      CommonMethod.sendToNextScreen(
                          context, Routes.resetVerification);
                    } else {
                      Fluttertoast.showToast(
                        msg: 'Please Enter Email ..!  ',
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 3,
                        // backgroundColor: Colors.red,
                        // textColor: Colors.yellow
                        backgroundColor: Colors.transparent,
                      );
                    }
                  },
                  child: AppButton(
                    fontSize: 18.sp,
                    buttonText: AppText.continueText,
                    buttonTextColor: AppColor.secondaryTextColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
