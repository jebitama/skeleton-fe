import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  bool isPressed = true;
  int currentIndex = 1;
  bool obscured = true;
  bool sObscured = true;

  int tabValue = 0;
  int index = 0;

  @override
  void onInit() {
    update();
    super.onInit();
  }
}
