import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:skeleton/core/routes/common_method.dart';
import 'package:skeleton/core/routes/route_path.dart';
import 'package:skeleton/core/styles/app_color.dart';
import 'package:skeleton/core/styles/theme/app_theme.dart';
import 'package:skeleton/core/styles/theme/theme_controller/theme_controller.dart';
import 'package:skeleton/core/utils/constant/app_image.dart';
import 'package:skeleton/core/utils/constant/app_string.dart';
import 'package:skeleton/core/widgets/app_button.dart';
import 'package:skeleton/core/widgets/app_custom_text.dart';
import 'package:skeleton/core/widgets/app_sizebox.dart';
import 'package:skeleton/core/widgets/password_textfield.dart';
import 'package:skeleton/modules/auth/controllers/reset_controller.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  ResetController resetController = Get.put(ResetController());
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Form(
            key: resetController.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 15.h, bottom: 35.h),
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            CommonMethod.popScreen(
                                context, Routes.resetVerification);
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
                        text: AppText.resetPassword,
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
                    text: AppText.resetpass,
                    textColor: themeController.isDarkMode()
                        ? AppColor.secondaryTextColor
                        : AppColor.primaryTextColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    textAlign: TextAlign.start,
                  ),
                ),
                PasswordTextField(
                  controller: resetController.newPasswordController,
                  textInputAction: TextInputAction.next,
                  obscureText: resetController.newObscured,
                  hintText: 'Enter New Password',
                  labelText: 'New Password',
                ),
                AppSpace(
                  height: 24.h,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 48.h),
                  child: PasswordTextField(
                    controller: resetController.confirmPasswordController,
                    textInputAction: TextInputAction.next,
                    obscureText: resetController.confirmObscured,
                    hintText: 'Enter Confirm Password',
                    labelText: 'Confirm  Password',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (resetController.formKey.currentState!.validate()) {
                      if (resetController.newPasswordController.text ==
                          resetController.confirmPasswordController.text) {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            backgroundColor: themeController.isDarkMode()
                                ? AppColor.darkContainer
                                : AppColor.secondaryTextColor,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25.r))),
                            insetPadding:
                                EdgeInsets.symmetric(horizontal: 20.h),
                            title: Column(
                              children: [
                                Image.asset(
                                  AppImages.passChangeDone,
                                  height: 92.h,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  AppText.passChange,
                                  style: TextStyle(
                                    color: AppTheme.getColorsTheme(context)
                                        .textTheme
                                        .titleMedium!
                                        .color,
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )
                              ],
                            ),
                            content: Text(AppText.passInstruct,
                                style: TextStyle(
                                  color: AppTheme.getColorsTheme(context)
                                      .textTheme
                                      .titleMedium!
                                      .color,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.center),
                            actions: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: 10.h, left: 5.h, right: 5.h),
                                child: GestureDetector(
                                  onTap: () {
                                    CommonMethod.pushRemoveUntil(
                                        context, Routes.authLogin);
                                  },
                                  child: AppButton(
                                    buttonTextColor:
                                        AppColor.secondaryTextColor,
                                    buttonText: AppText.ok,
                                    fontSize: 18.sp,
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      } else {
                        passwordNotSame();
                      }
                    }
                  },
                  child: AppButton(
                    fontSize: 18.sp,
                    buttonText: AppText.create,
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

  passwordNotSame() {
    return Fluttertoast.showToast(
        msg: "Both Password Not Same..",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
