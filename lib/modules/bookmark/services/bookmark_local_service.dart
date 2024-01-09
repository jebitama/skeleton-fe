import 'package:get/get.dart';
import 'package:skeleton/core/di/local_storage_service.dart';

class BookmarkLocalService extends GetxService {
  static const _bookmarkKey = 'user_bookmark';

  late LocalStorageService _localStorageService;

  BookmarkLocalService() {
    _localStorageService = Get.find();
  }

  Future<void> setUserBookmark(List<String> bookmarks) async {
    await _localStorageService.put<List<String>>(
        'app_journey', _bookmarkKey, bookmarks);
  }

  Future<void> removeUserBookmark() async {
    await _localStorageService.delete<String>('app_journey', _bookmarkKey);
  }

  Future<List<String>?> getUserBookmark() async {
    return await _localStorageService.get<List<String>>(
        'app_journey', _bookmarkKey);
  }
}
