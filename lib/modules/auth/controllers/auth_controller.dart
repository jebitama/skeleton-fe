import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:skeleton/modules/auth/models/user_local_model.dart';
import 'package:skeleton/modules/auth/services/auth_local_service.dart';

class AuthController extends GetxController {
  final AuthLocalService _authService = Get.find();

  RxBool isLoading = true.obs;
  RxBool isAuthenticated = false.obs;

  Future<void> login() async {
    // Perform authentication logic
    isAuthenticated.value = true;
    await setUserToken('token');
  }

  void logout() {
    // Perform logout logic
    isAuthenticated.value = false;
  }

  Future<void> setUserToken(String token) async {
    try {
      isLoading.value = true;
      await _authService.setUserToken(token);
    } catch (error) {
      if (kDebugMode) {
        print('Error setUserToken: $error');
      }
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> removeUserToken() async {
    try {
      isLoading.value = true;
      await _authService.removeUserToken();
    } catch (error) {
      if (kDebugMode) {
        print('Error removeUserToken: $error');
      }
    } finally {
      isLoading.value = false;
    }
  }

  Future getUserData() async {
    try {
      isLoading.value = true;
      final user = await _authService.getUserProfile();
      return user;
    } catch (error) {
      if (kDebugMode) {
        print('Error getUserProfile: $error');
      }
      return null;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> setUserData(UserLocal? profile) async {
    if (kDebugMode) {
      print('userProfile: $profile');
    }
    try {
      isLoading.value = true;

      // Check if profile is not null before setting the user profile
      if (profile != null) {
        await _authService.setUserProfile(profile);
        // You can proceed with other logic if needed
      } else {
        // Handle the case where profile is null
        if (kDebugMode) {
          print('Error setUserProfile: User profile is null.');
        }
        // You may want to throw an exception or log an error message
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error setUserProfile: $error');
      }
    } finally {
      isLoading.value = false;
    }
  }
}
