import 'package:skeleton/core/di/dependencies.dart';
import 'package:skeleton/modules/auth/services/auth_service.dart';
import 'package:skeleton/modules/onboarding/services/onboarding_service.dart';

import 'core/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  final LocalStorageService localStorageService = Get.find();
  final AuthService authService = AuthService(Get.find());
  final OnboardingService onboardingService = OnboardingService(Get.find());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // The async initialization is complete, return the GetMaterialApp
          return snapshot.data as Widget;
        } else {
          const loading = CircularProgressIndicator();
          // While async initialization is in progress, return a loading indicator or splash screen
          return loading;
        }
      },
    );
  }

  Future<Widget> _initializeApp() async {
    return GetMaterialApp(
      title: 'Wonderful Bali',
      initialRoute: await _getInitialRoute(),
      getPages: AppPages.pages,
      initialBinding: OnboardingInjection(),
    );
  }

  Future<String> _getInitialRoute() async {
    final userToken = await authService.getUserToken();
    final isUserOnboardingCompleted = await onboardingService.getUserOnboard();
    if (isUserOnboardingCompleted != null &&
        isUserOnboardingCompleted.isNotEmpty) {
      return Routes.ONBOARDING;
    } else if (userToken != null && userToken.isNotEmpty) {
      return Routes.HOMEPAGE; // or Routes.AUTH based on your logic
    } else {
      return Routes.HOMEPAGE;
    }
  }
}
