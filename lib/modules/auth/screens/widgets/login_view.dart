// ignore_for_file: use_build_context_synchronously

import 'package:flutter/foundation.dart';
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
import 'package:skeleton/core/widgets/password_textfield.dart';
import 'package:skeleton/modules/auth/controllers/auth_controller.dart';
import 'package:skeleton/modules/auth/controllers/login_form_controller.dart';
import 'package:skeleton/modules/auth/models/user_local_model.dart';

class LoginView extends StatefulWidget {
  final TabController tab;
  const LoginView({super.key, required this.tab});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LoginFormController loginPageController = Get.find();
  final AuthController _authController = Get.find();
  final ThemeController themeController = Get.find();

  Future<void> login() async {
    String loginEmail = loginPageController.emailController.text;
    String loginPass = loginPageController.passwordController.text;

    if (kDebugMode) {
      print('loginEmailVal: $loginEmail');
      print('loginPassVal: $loginPass');
    }
    final UserLocal user = UserLocal(
      email: loginEmail,
      pass: loginPass,
    );

    if (kDebugMode) {
      print('user: $user');
    }

    // await _authController.setUserData(user);
    await _authController.login();
  }

  @override
  void initState() {
    if (kDebugMode) {
      print('login view loaded');
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15.h),
              child: CustomText(
                text: AppText.pleaseLogin,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                textColor: AppColor.primaryTextColor,
                textAlign: TextAlign.start,
              ),
            ),
            AppSpace(
              height: 34.h,
            ),
            EmailTextField(
              controller: loginPageController.emailController,
            ),
            AppSpace(
              height: 24.h,
            ),
            PasswordTextField(
              controller: loginPageController.passwordController,
              obscureText: loginPageController.obscured,
            ),
            AppSpace(
              height: 16.h,
            ),
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  CommonMethod.sendToNextScreen(context, Routes.forgotPass);
                },
                child: CustomText(
                  textAlign: TextAlign.end,
                  textColor: themeController.isDarkMode()
                      ? AppColor.secondaryTextColor
                      : AppColor.primaryTextColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  text: AppText.forgotPass,
                ),
              ),
            ),
            AppSpace(
              height: 48.h,
            ),
            GestureDetector(
              onTap: () async {
                if (formKey.currentState!.validate()) {
                  if (kDebugMode) {
                    print('form ok');
                  }

                  await login();

                  if (kDebugMode) {
                    print('should render toast');
                  }
                  await Fluttertoast.showToast(
                    msg: 'Login Successfully',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 3,
                    // backgroundColor: Colors.red,
                    // textColor: Colors.yellow
                    backgroundColor: Colors.transparent,
                  );

                  if (kDebugMode) {
                    print('login + regist ok');
                  }
                  CommonMethod.pushRemoveUntil(context, Routes.bottomNav);
                } else {
                  Fluttertoast.showToast(
                    msg: 'Enter Correct Email & Password ..!  ',
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
                buttonTextColor: AppColor.secondaryTextColor,
                buttonText: AppText.login,
              ),
            )
          ],
        ),
      ),
    );
  }
}
