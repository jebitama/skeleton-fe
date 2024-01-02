import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var path = Directory.current.path;
  Hive.init(path);
  // Hive init
  runApp(MyApp());
}
