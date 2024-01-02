import 'package:skeleton/core/di/dependencies.dart';

class OnboardingService {
  static const _onboardingKey = 'is_onboard';

  final LocalStorageService _localStorageService;

  OnboardingService(this._localStorageService);

  Future<void> setUserOnboard(String token) async {
    await _localStorageService.put('user_journey', _onboardingKey, token);
  }

  Future<String?> getUserOnboard() async {
    return await _localStorageService.get('user_journey', _onboardingKey);
  }
}
