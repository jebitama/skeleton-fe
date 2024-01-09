// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class ColorConstant {
  static List<String> fav = [];
  static var mainTheme = ThemeData(
    canvasColor: Colors.white,
    cardColor: const Color(0xFF000000),
    dividerColor: Colors.white,
    shadowColor: const Color(0XFFFFFBE5),
    bottomAppBarTheme: const BottomAppBarTheme(color: Color(0xFFFF595D)),
  );

  static var darkTheme = ThemeData(
    canvasColor: Colors.black,
    cardColor: Colors.white,
    dividerColor: const Color(0xFF1C1C1C),
    shadowColor: const Color(0x33FAFAFA),
    bottomAppBarTheme: const BottomAppBarTheme(color: Colors.white),
  );

  static ThemeData getCurrentTheme(BuildContext context) {
    return Theme.of(context);
  }

  static getScaffoldColor(BuildContext context) {
    return getCurrentTheme(context).canvasColor;
  }

  static getFontColor(BuildContext context) {
    return getCurrentTheme(context).cardColor;
  }

  static getSplashColor(BuildContext context) {
    return getCurrentTheme(context).bottomAppBarColor;
  }

  static getContainerColor(BuildContext context) {
    return getCurrentTheme(context).dividerColor;
  }

  static getShadowColor(BuildContext context) {
    return getCurrentTheme(context).shadowColor;
  }
}
