import 'package:get/get.dart';
import 'package:skeleton/modules/onboarding/controllers/onboarding_controller.dart';
import 'package:skeleton/modules/onboarding/services/onboarding_service.dart';

class OnboardingInjection extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardingController());
    Get.lazyPut(() => OnboardingService(Get.find()));
  }
}
