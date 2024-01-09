import 'package:get/get.dart';

class PageViewController extends GetxController {
  // final pageController = PageController(
  //   initialPage: 0,
  // );
  // final controllers = PageController(initialPage: 0);

  // PageController controllers = PageController();

  int index = 0;
  int i = 0;

  changeIndex(int value) {
    index = value;
    update();
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   controllers.dispose();
  // }

  // @override
  // void onInit() {
  //   update();
  //   index;
  //   super.onInit();
  // }
}
