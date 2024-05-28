import 'package:flutter/material.dart';
import 'package:library_app_admin/core/constants/constants.dart';

const BottomNavigationBarThemeData bottomNavigationBarTheme = BottomNavigationBarThemeData(
  backgroundColor: AppColors.whiteWhite,
  selectedItemColor: AppColors.brandColor500Default,
  unselectedItemColor: AppColors.greyscale400,
  selectedLabelStyle: AppTextStyle.otherCaption,
  unselectedLabelStyle: AppTextStyle.otherCaption,
  type: BottomNavigationBarType.fixed,
);
