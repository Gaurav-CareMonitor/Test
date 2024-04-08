import 'package:flutter/material.dart';

class AppColor {
  static const primary = Color(0xff0066CC);
  static const primaryShade100 = Color(0xffD7E7F7);

  static const success = Color(0xFF40BE60);
  static const error = Color(0xFFEB4D2C);
  static const warning = Color(0xFFED9502);

  static const persianRed500 = Color(0xffD5322E);

  static const background = Color(0xffF0F3F9);
  static const secondary = Color(0xffA1AAB3);

  /// Converts [Color] to [MaterialColor]
  static MaterialColor buildMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}
