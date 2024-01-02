import 'package:get/get.dart';
import 'package:skeleton/core/di/dependencies.dart';

class AppInjection extends Bindings {
  @override
  void dependencies() {
    Get.put(LocalStorageService()); // Register LocalStorageService
  }
}
