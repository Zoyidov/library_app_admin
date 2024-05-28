import 'package:flutter/material.dart';
import 'package:library_app_admin/core/constants/constants.dart';

final InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
  isDense: true,
  focusColor: AppColors.brandColor500Default,
  focusedBorder: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
    borderSide: BorderSide(color: AppColors.brandColor500Default),
  ),
  enabledBorder: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
    borderSide: BorderSide(color: AppColors.greyscale300),
  ),
  border: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
  ),
  errorBorder: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
    borderSide: BorderSide(color: AppColors.error500),
  ),
  disabledBorder: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
    borderSide: BorderSide(color: AppColors.greyscale300),
  ),
  fillColor: AppColors.greyscale300,
  helperStyle: AppTextStyle.otherCaption.copyWith(color: AppColors.greyscale400),
  errorStyle: AppTextStyle.otherCaption.copyWith(color: AppColors.error500),
  hintStyle: AppTextStyle.subtitleS2.copyWith(color: AppColors.greyscale400),
);
