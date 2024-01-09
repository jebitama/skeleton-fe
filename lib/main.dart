import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:skeleton/core/di/dependencies.dart';
import 'package:skeleton/core/di/local_storage_service.dart';
import 'package:skeleton/core/local_adapter/list_string_adapter.dart';
import 'package:skeleton/core/styles/theme/theme_controller/theme_controller.dart';
import 'package:skeleton/modules/auth/models/local_adapter/user_adapter.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var appDocumentsDirectory = await getApplicationDocumentsDirectory();
  var path = appDocumentsDirectory.path;
  Hive.init(path);

  // register model adapter
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(ListStringAdapter());

  // core binding
  Get.put(LocalStorageService());
  Get.put(ThemeController());
  Get.put(OnboardingModule());

  // Hive init
  runApp(const MyApp());
}
