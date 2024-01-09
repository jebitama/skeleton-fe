import 'package:get/get.dart';
import 'package:skeleton/core/di/local_storage_service.dart';
import 'package:skeleton/modules/auth/models/user_local_model.dart';

class AuthLocalService extends GetxService {
  static const _userTokenKey = 'user_token';
  static const _userProfileKey = 'user_profile';

  late LocalStorageService _localStorageService;

  AuthLocalService() {
    _localStorageService = Get.find();
  }

  Future<void> setUserToken(String token) async {
    await _localStorageService.put<String>('app_token', _userTokenKey, token);
  }

  Future<void> removeUserToken() async {
    await _localStorageService.delete<String>('app_token', _userTokenKey);
  }

  Future<String?> getUserToken() async {
    return _localStorageService.get<String>('app_token', _userTokenKey);
  }

  Future<void> setUserProfile(UserLocal user) async {
    await _localStorageService.put<String>(
        'user_data', _userProfileKey, 'user');
  }

  Future<UserLocal?> getUserProfile() async {
    return _localStorageService.get<UserLocal>('user_data', _userProfileKey);
  }
}
