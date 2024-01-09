import 'package:get/get.dart';
import 'package:skeleton/core/di/dependencies.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    // register what should binding first
    Get.put(AuthModule());
    Get.put(HomepageModule());
  }
}
