import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ThemeController extends GetxController {
  RxBool switchTheme = false.obs;

  @override
  void onInit() {
    switchTheme.value;
    setData();
    isDarkMode();
    update();
    super.onInit();
  }

  setData() async {
    // switchTheme.value =await PrefData.getDarkMode();
    update();
  }

  isDarkMode() {
    return switchTheme.value;
  }

  void setTheme(bool value) {
    // PrefData.setDarkMode(value);
    update();
  }
}
