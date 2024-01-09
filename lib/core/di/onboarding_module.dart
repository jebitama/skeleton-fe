import 'package:get/get.dart';
import 'package:skeleton/modules/onboarding/controllers/page_view_controller.dart';
import 'package:skeleton/modules/onboarding/onboarding_screen.dart';
import 'package:skeleton/modules/onboarding/screens/page_view.dart';
import 'package:skeleton/modules/onboarding/services/onboarding_service.dart';

class OnboardingModule extends Bindings {
  @override
  void dependencies() {
    // onboarding
    Get.lazyPut(() => PageViewController());
    Get.put(OnboardingService());

    // screen
    Get.lazyPut(() => const OnboardingPageScreen());
    Get.lazyPut(() => const OnboardingScreen());
  }
}
