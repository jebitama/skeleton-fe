import 'package:hive/hive.dart';

class LocalStorageService {
  Future<void> put(dynamic entity, dynamic key, dynamic value) async {
    final box = await Hive.openBox(entity ?? 'app_setting');
    await box.put(key, value);
    await box.close();
  }

  Future<dynamic> get(dynamic entity, dynamic key) async {
    final box = await Hive.openBox(entity ?? 'app_setting');
    final value = box.get(key);
    await box.close();
    return value;
  }
}
