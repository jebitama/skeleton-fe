import 'package:skeleton/core/di/dependencies.dart';

class AuthService {
  static const _userTokenKey = 'user_token';

  final LocalStorageService _localStorageService;

  AuthService(this._localStorageService);

  Future<void> setUserToken(String token) async {
    await _localStorageService.put('app_setting', _userTokenKey, token);
  }

  Future<String?> getUserToken() async {
    return await _localStorageService.get('app_setting', _userTokenKey);
  }
}
