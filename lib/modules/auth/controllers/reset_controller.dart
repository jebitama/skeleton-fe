import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ResetController extends GetxController {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool newObscured = false;
  bool confirmObscured = true;

  @override
  void onInit() {
    update();
    super.onInit();
  }
}
