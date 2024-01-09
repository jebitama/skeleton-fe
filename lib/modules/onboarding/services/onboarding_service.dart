import 'package:get/instance_manager.dart';
import 'package:skeleton/core/di/local_storage_service.dart';

class OnboardingService {
  static const _onboardingKey = 'is_onboard';

  final LocalStorageService _localStorageService = Get.find();

  Future<void> setUserOnboard(String intro) async {
    await _localStorageService.put('user_journey', _onboardingKey, intro);
  }

  Future<String?> getUserOnboard() async {
    return await _localStorageService.get('user_journey', _onboardingKey);
  }
}
