import 'package:flutter/material.dart';
import '../constants/constants.dart';


final FilledButtonThemeData filledButtonTheme = FilledButtonThemeData(
  style: FilledButton.styleFrom(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    fixedSize: const Size.fromHeight(48),
    backgroundColor: AppColors.brandColor500Default,
    foregroundColor: AppColors.whiteWhite,
    textStyle: AppTextStyle.buttonAaLarge,
  ),
);

final OutlinedButtonThemeData outlinedButtonTheme = OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
      side: const BorderSide(color: AppColors.greyscale600),
    ),
    fixedSize: const Size.fromHeight(48),
    backgroundColor: AppColors.whiteWhite,
    foregroundColor: AppColors.greyscale600,
    textStyle: AppTextStyle.buttonAaLarge,
  ),
);
