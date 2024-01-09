import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:skeleton/core/styles/app_color.dart';
import 'package:skeleton/core/utils/constant/app_string.dart';
import 'package:skeleton/core/widgets/app_button.dart';
import 'package:skeleton/core/widgets/app_custom_text.dart';
import 'package:skeleton/core/widgets/app_sizebox.dart';
import 'package:skeleton/core/widgets/email_textfield.dart';
import 'package:skeleton/core/widgets/name_textfield.dart';
import 'package:skeleton/core/widgets/password_textfield.dart';
import 'package:skeleton/modules/auth/controllers/auth_controller.dart';
import 'package:skeleton/modules/auth/controllers/login_form_controller.dart';
import 'package:skeleton/modules/auth/models/user_local_model.dart';

class SignUpView extends StatefulWidget {
  final TabController tab;
  const SignUpView({super.key, required this.tab});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  LoginFormController loginPageController = Get.find();
  final AuthController _authController = Get.find();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> signUp() async {
    WidgetsFlutterBinding.ensureInitialized();
    final user = UserLocal(
      name: loginPageController.nameController.text,
      lastname: loginPageController.lastNameController.text,
      email: loginPageController.emailController.text,
      pass: loginPageController.passwordController.text,
    );

    await _authController.setUserData(user);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Form(
        key: formKey,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            CustomText(
              text: AppText.pleaseSignUp,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              textColor: AppColor.primaryTextColor,
              textAlign: TextAlign.start,
            ),
            const AppSpace(
              height: 34,
            ),
            NameTextField(
              controller: loginPageController.nameController,
              validatorError: 'Please Enter Valid Name.. ',
            ),
            AppSpace(
              height: 24.h,
            ),
            NameTextField(
              controller: loginPageController.lastNameController,
              validatorError: 'Please Enter Valid Last Name.. ',
              labelText: 'Last name',
              hintText: 'Last name',
            ),
            AppSpace(
              height: 24.h,
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
              height: 48.h,
            ),
            GestureDetector(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  signUp();
                  Fluttertoast.showToast(
                    msg: 'SignUp Successfully',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 3,
                    backgroundColor: Colors.transparent,
                  );
                  loginPageController.tabValue = 0;
                  loginPageController.currentIndex =
                      loginPageController.currentIndex - 1;
                  // print('index====>${loginPageController.currentIndex}');
                  widget.tab.index = 0;
                }
              },
              child: AppButton(
                fontSize: 18.sp,
                buttonTextColor: AppColor.secondaryTextColor,
                buttonText: AppText.signUp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
