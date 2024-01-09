import 'package:get/get.dart';
import 'package:skeleton/modules/auth/controllers/auth_controller.dart';
import 'package:skeleton/modules/auth/controllers/register_form_controller.dart';
import 'package:skeleton/modules/auth/services/auth_local_service.dart';

class AuthModule extends Bindings {
  @override
  void dependencies() {
    // auth
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => RegisterController());
    Get.lazyPut(() => AuthLocalService());
    Get.lazyPut(() => AuthController());
  }
}
