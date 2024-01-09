import 'package:get/get.dart';
import 'package:skeleton/modules/homepage/controllers/home_controller.dart';
import 'package:skeleton/modules/homepage/controllers/post_controller.dart';
import 'package:skeleton/modules/homepage/services/post_service.dart';

class HomepageModule extends Bindings {
  @override
  void dependencies() {
    // homepage
    Get.lazyPut(() => HomepageController());
    Get.lazyPut(() => PostController());
    Get.lazyPut(() => PostService());
  }
}
