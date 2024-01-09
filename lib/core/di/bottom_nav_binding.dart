import 'package:get/get.dart';
import 'package:skeleton/modules/bottom_nav/controllers/bottom_bar_controller.dart';

class BottomNavBinding extends Bindings {
  @override
  void dependencies() {
    // register what should binding first
    Get.put(BottomNavController());
  }
}
