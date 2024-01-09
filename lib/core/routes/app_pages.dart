import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:skeleton/app.dart';
import 'package:skeleton/core/di/dependencies.dart';
import 'package:skeleton/core/routes/route_path.dart';
import 'package:skeleton/modules/account/account_screen.dart';
import 'package:skeleton/modules/auth/login_screen.dart';
import 'package:skeleton/modules/auth/screens/forgotpassword_screen.dart';
import 'package:skeleton/modules/auth/screens/register_screen.dart';
import 'package:skeleton/modules/auth/screens/verification_screen.dart';
import 'package:skeleton/modules/bookmark/bookmark_screen.dart';
import 'package:skeleton/modules/bottom_nav/bottom_nav.dart';
import 'package:skeleton/modules/explore/explore_screen.dart';
import 'package:skeleton/modules/homepage/homepage_screen.dart';
import 'package:skeleton/modules/onboarding/screens/page_view.dart';
import 'package:skeleton/modules/onboarding/screens/splash_screen.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.initial,
      page: () => const MyApp(),
    ),
    GetPage(
      name: Routes.bottomNav,
      page: () => const BottomNav(),
      binding: BottomNavBinding(),
    ),
    GetPage(
      name: Routes.splash,
      page: () => const SplashScreen(),
    ),

    /*==========================  Auth Routes  ============================*/
    GetPage(
      name: Routes.authLogin,
      page: () => const LoginScreen(),
      binding: AuthModule(),
    ),
    GetPage(
      name: Routes.authRegister,
      page: () => const RegisterScreen(),
    ),
    GetPage(
      name: Routes.resetVerification,
      page: () => const VerificationScreen(),
    ),
    GetPage(
      name: Routes.forgotPass,
      page: () => const ForgotPassScreen(),
    ),

    /*=========================  Homepage Routes  ==========================*/
    GetPage(
      name: Routes.homepage,
      page: () => const HomepageScreen(),
      binding: HomepageModule(),
    ),

    /*========================  Onboarding Routes  =========================*/
    GetPage(
      name: Routes.onboarding,
      page: () => const OnboardingPageScreen(),
    ),

    /*=========================  Bookmark Routes  ===========================*/
    GetPage(
      name: Routes.bookmark,
      page: () => const BookmarkScreen(),
    ),

    /*==========================  Account Routes  ===========================*/
    GetPage(
      name: Routes.onboarding,
      page: () => const AccountScreen(),
    ),

    /*==========================  Explore Routes  ===========================*/
    GetPage(
      name: Routes.onboarding,
      page: () => const ExploreScreen(),
    ),
  ];
}
