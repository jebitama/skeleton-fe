import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton/core/styles/color_constant.dart';
// import 'package:skeleton/core/routes/common_method.dart';
// import 'package:skeleton/core/routes/route_path.dart';
import 'package:skeleton/core/utils/constant/app_image.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // setNavigate();
    super.initState();
  }

  // Future<void> setNavigate() async {
  //   // bool isIntro = await PrefData.getIntro();
  //   // bool isLogin = await PrefData.getLogin();
  //   Future.delayed(
  //     const Duration(seconds: 3),
  //         () {
  //       if (isIntro) {
  //        CommonMethod.pushRemoveUntil(context, Routes.onboarding);
  //       }
  //       else {
  //         if (isLogin) {
  //          CommonMethod.pushRemoveUntil(context, Routes.authLogin);
  //         }
  //         else {
  //          CommonMethod.pushRemoveUntil(context, Routes.bottomBar);
  //         }
  //       }

  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));

    return Scaffold(
      backgroundColor: ColorConstant.getScaffoldColor(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.appIcon,
              height: 120.h,
              width: 120.h,
            ),
            SizedBox(
              height: 15.h,
            ),
          ],
        ),
      ),
    );
  }
}
