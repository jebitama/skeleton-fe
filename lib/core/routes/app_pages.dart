import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:skeleton/app.dart';
import 'package:skeleton/modules/auth/auth_module.dart';
import 'package:skeleton/modules/homepage/homepage_module.dart';

abstract class Routes {
  static const INITIAL = '/';
  static const AUTH = '/auth';
  static const HOMEPAGE = '/homepage';
  static const ONBOARDING = '/homepage';
}

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => MyApp(),
    ),
    GetPage(
      name: Routes.AUTH,
      page: () => AuthModule(),
    ),
    GetPage(
      name: Routes.HOMEPAGE,
      page: () => HomepageModule(),
    ),
  ];
}
