import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:skeleton/modules/bookmark/services/bookmark_local_service.dart';

class BookmarkController extends GetxController {
  CarouselController buttonCarouselController = CarouselController();
  BookmarkLocalService bookmarkLocalService = Get.put(BookmarkLocalService());

  bool isPressed = true;
  int data = 0;
  RxInt i = 0.obs;

  List<String> favouriteList = [];

  getData() async {
    try {
      final favourites = await bookmarkLocalService.getUserBookmark() ?? [];
      if (favouriteList.isNotEmpty) {
        favouriteList = favourites;
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error bookmark get: $error');
      }
    }
    update();
  }

  setData(List<String> bookmarks) async {
    try {
      await bookmarkLocalService.setUserBookmark(bookmarks);
    } catch (error) {
      if (kDebugMode) {
        print('Error bookmark set: $error');
      }
    }
    update();
  }

  // appText(){
  //
  //
  //   isPressed? AppText.favorites:'Collection';
  //   update();
  //
  //
  // }

  @override
  void onInit() {
    getData();
    update();
    super.onInit();
  }
}
