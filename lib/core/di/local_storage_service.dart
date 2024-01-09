import 'package:hive/hive.dart';

class LocalStorageService {
  Future<void> put<T>(String boxName, dynamic key, T value) async {
    final box = await Hive.openBox<T>(boxName);
    try {
      await box.put(key, value);
    } finally {
      await box.close();
    }
  }

  Future<T?> get<T>(String boxName, dynamic key) async {
    final box = await Hive.openBox<T>(boxName);
    try {
      return box.get(key);
    } finally {
      await box.close();
    }
  }

  Future<void> delete<T>(String boxName, dynamic key) async {
    final box = await Hive.openBox<T>(boxName);
    try {
      await box.delete(key);
    } finally {
      await box.close();
    }
  }
}
