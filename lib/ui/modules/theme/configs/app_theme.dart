import 'package:flutter/material.dart';

import 'package:plant_app/ui/modules/theme/configs/app_colors.dart';
import 'package:plant_app/ui/modules/theme/configs/baseappcolor.dart';
import 'package:plant_app/ui/modules/theme/configs/text_theme.dart';

class AppTheme {
  AppTheme._();
  static ThemeData lightTheme() {
    final appColor = LightAppColor();
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: appColor.primary),
      textTheme: AppTextTheme.withColor(appColor).textTheme,
      radioTheme: RadioThemeData(
        fillColor: MaterialStateColor.resolveWith((states) => appColor.info),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        // backgroundColor: appColor.scaffoldBackgroundColor,
        // dragHandleColor: appColor.borderColor,
        showDragHandle: true,
      ),
      // scaffoldBackgroundColor: appColor.scaffoldBackgroundColor,
      useMaterial3: true,
    );
  }

  static ThemeData darkTheme() {
    final appColor = DarkAppColor();
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: appColor.primary),
      textTheme: AppTextTheme.withColor(appColor).textTheme,
      radioTheme: RadioThemeData(
        fillColor: MaterialStateColor.resolveWith((states) => appColor.info),
      ),
      // bottomSheetTheme: BottomSheetThemeData(
      //   backgroundColor: appColor.scaffoldBackgroundColor,
      //   dragHandleColor: appColor.borderColor,
      //   showDragHandle: true,
      // ),
      // scaffoldBackgroundColor: appColor.scaffoldBackgroundColor,
      // useMaterial3: true,
    );
  }
}
