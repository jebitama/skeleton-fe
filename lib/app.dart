// import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton/core/di/app_binding.dart';
import 'package:skeleton/core/routes/route_path.dart';
// import 'package:skeleton/core/routes/route_path.dart';
import 'package:skeleton/core/styles/theme/app_theme.dart';
import 'package:skeleton/core/styles/theme/theme_controller/theme_controller.dart';
import 'package:skeleton/modules/onboarding/screens/splash_screen.dart';
// import 'package:skeleton/modules/onboarding/services/onboarding_service.dart';
// import 'package:skeleton/modules/auth/services/auth_local_service.dart';
import 'core/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetBuilder<ThemeController>(
              builder: (controller) {
                return GetMaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Wonderful Bali',
                  initialRoute: Routes.onboarding,
                  getPages: AppPages.pages,
                  home: child,
                  theme: ThemeData(
                    fontFamily: 'OpenSans',
                  ),
                  darkTheme: controller.switchTheme.value
                      ? AppTheme.lightThem
                      : AppTheme.darkThem,
                  themeMode: controller.switchTheme.value
                      ? ThemeMode.dark
                      : ThemeMode.light,
                  initialBinding: InitialBinding(),
                );
              },
              init: ThemeController());
        },
        child: const SplashScreen());
  }

  // Future<Widget> _initializeApp(bool? isThemeSwitched, Widget? child) async {
  //   // Default to false if isThemeSwitched is null
  //   final bool useDarkTheme = isThemeSwitched ?? false;
  //   return GetMaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     title: 'Wonderful Bali',
  //     initialRoute: '/onboarding',
  //     getPages: AppPages.pages,
  //     home: child,
  //     theme: ThemeData(
  //       fontFamily: 'OpenSans',
  //     ),
  //     darkTheme: useDarkTheme ? AppTheme.lightThem : AppTheme.darkThem,
  //     themeMode: useDarkTheme ? ThemeMode.dark : ThemeMode.light,
  //     initialBinding: InitialBinding(),
  //   );
  // }

//   Future<String> _getInitialRoute() async {
//     // final AuthLocalService authLocalService = AuthLocalService(Get.find());
//     if (kDebugMode) {
//       print('Getting initial route');
//     }

//     // Simulate some asynchronous initialization if needed
//     await Future.delayed(const Duration(seconds: 2));

//     // Try to find OnboardingService after a delay
//     OnboardingService? onboardingService;
//     try {
//       onboardingService = Get.find<OnboardingService>();
//     } catch (e) {
//       if (kDebugMode) {
//         print('OnboardingService not found, creating a new instance');
//       }
//     }

//     if (onboardingService == null) {
//       // Create and register a new instance if not found
//       onboardingService = OnboardingService();
//       Get.put(onboardingService);
//     }

//     // final userToken = await authLocalService.getUserToken();
//     final isUserOnboardingCompleted = await onboardingService.getUserOnboard();
//     if (kDebugMode) {
//       print('Is user onboarding completed: $isUserOnboardingCompleted');
//     }

//     if (isUserOnboardingCompleted != null &&
//         isUserOnboardingCompleted.isNotEmpty) {
//       return Routes.onboarding;
//     }
//     // } else if (userToken != null && userToken.isNotEmpty) {
//     //   return Routes.homepage; // or Routes.AUTH based on your logic
//     // } else {
//     return Routes.onboarding;
//     // }
//   }
}
