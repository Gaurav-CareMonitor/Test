import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/ts.dart';
import 'app_color.dart';

class AppTheme {
  static ThemeData primary(BuildContext context) {
    ThemeData appTheme = ThemeData(
        primarySwatch: AppColor.buildMaterialColor(AppColor.primary),
        primaryColor: AppColor.primary,
        useMaterial3: false,
        scaffoldBackgroundColor: AppColor.background,
        fontFamily: Ts.fontFamily,
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(color: AppColor.secondary, fontSize: 20),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColor.secondary)),
        ),
        indicatorColor: AppColor.primary,
        appBarTheme: AppBarTheme(
            color: Colors.white,
            actionsIconTheme: const IconThemeData(color: Colors.black),
            iconTheme: const IconThemeData(color: Colors.black),
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            titleTextStyle: Ts.style(color: Colors.black)));

    return appTheme.copyWith(textTheme: Ts.textTheme(appTheme.textTheme));
  }
}
