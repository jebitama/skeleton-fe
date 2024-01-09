import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skeleton/core/di/dependencies.dart';
import 'package:skeleton/core/styles/app_color.dart';
import 'package:skeleton/core/utils/constant/app_string.dart';
import 'package:skeleton/modules/auth/controllers/login_form_controller.dart';
import 'package:skeleton/modules/auth/screens/widgets/login_view.dart';
import 'package:skeleton/modules/auth/screens/widgets/signup_view.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  LoginFormController loginPageController = Get.put(LoginFormController());
  AuthModule authModule = Get.find();

  late TabController _tabController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  @override
  void initState() {
    // initiate dependency injection Getx
    authModule.dependencies();

    loginPageController;
    _tabController = TabController(vsync: this, length: 2);
    _tabController.addListener(_handleTabSelection);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          tabBar(),
          tabView(),
        ],
      ),
    );
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {
        loginPageController.currentIndex = _tabController.index;
        // print(loginPageController.currentIndex);
      });
    }
  }

  Widget tabBar() {
    return Padding(
      padding: EdgeInsets.only(left: 15.h, right: 15.h, top: 40.h),
      child: SizedBox(
        height: 40.h,
        child: TabBar(
          controller: _tabController,
          indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                width: 2.h,
                color: AppColor.primaryColor,
              ),
              borderRadius: BorderRadius.circular(10.r),
              insets: EdgeInsets.only(left: 0, right: 20.h, bottom: 4.h)),
          unselectedLabelStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            fontFamily: 'OpenSans',
            color: AppColor.grey50,
          ),
          isScrollable: true,
          labelPadding: EdgeInsets.only(left: 0, right: 20.h, bottom: 5.h),
          unselectedLabelColor: AppColor.grey50,
          labelColor: AppColor.primaryColor,
          onTap: (value) {
            // print('Tab is ===> $value');
            loginPageController.tabValue = value;
            loginPageController.update();
          },
          tabs: [
            Text(
              AppText.login,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
              ),
            ),
            Text(
              AppText.signUp,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget tabView() {
    return Expanded(
      child: TabBarView(controller: _tabController, children: [
        LoginView(
          tab: _tabController,
        ),
        SignUpView(
          tab: _tabController,
        ),
      ]),
    );
  }
}
