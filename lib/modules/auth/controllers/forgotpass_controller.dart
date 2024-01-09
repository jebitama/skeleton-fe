import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgotPassController extends GetxController {
  TextEditingController forgotEmailController = TextEditingController();
  final GlobalKey<FormState> forgotKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    update();
  }
}
