import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BottomNavController extends GetxController {
  int currentIndex = 0;

  setIndex(int indexs) {
    currentIndex = indexs;
    update();
  }

  onExit() {
    if (currentIndex != 0) {
      currentIndex = 0;
      update();
    } else {
      if (Platform.isIOS) {
        exit(0);
      } else {
        SystemNavigator.pop();
      }
    }
  }

  @override
  void onInit() {
    update();
    super.onInit();
  }
}
