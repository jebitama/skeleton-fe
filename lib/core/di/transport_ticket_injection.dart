import 'package:get/get.dart';
import 'package:skeleton/core/di/dependencies.dart';
import 'package:skeleton/modules/auth/auth_routes.dart';
import 'package:skeleton/modules/auth/controllers/auth_controller.dart';
import 'package:skeleton/modules/auth/services/auth_service.dart';

class TraInjection extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => AuthService(Get.find()));
    Get.put(LocalStorageService()); // Register LocalStorageService

    // Register the AuthRoutes as a dependency
    Get.put(AuthRoutes(), permanent: true);
  }
}
