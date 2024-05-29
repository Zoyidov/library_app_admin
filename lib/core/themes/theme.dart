import 'package:flutter/material.dart';
import 'package:library_app_admin/core/constants/constants.dart';
import 'input_decoration_theme.dart';
import 'button_themes.dart';
import 'app_bar_theme.dart';
import 'bottom_navigation_bar_theme.dart';
import 'app_text_theme.dart';

final ThemeData appTheme = ThemeData(
  colorSchemeSeed: AppColors.brandColor500Default,
  // TODO: Refactor this
  bottomAppBarTheme: const BottomAppBarTheme(
    color: AppColors.whiteWhite,
    surfaceTintColor: AppColors.whiteWhite,

  ),
  dialogBackgroundColor: Colors.white,
  dialogTheme:    DialogTheme(backgroundColor: Colors.white),
  scaffoldBackgroundColor: AppColors.whiteWhite,
  inputDecorationTheme: inputDecorationTheme,
  filledButtonTheme: filledButtonTheme,
  outlinedButtonTheme: outlinedButtonTheme,
  appBarTheme: appBarTheme,
  textTheme: appTextTheme,
  bottomNavigationBarTheme: bottomNavigationBarTheme,
);
