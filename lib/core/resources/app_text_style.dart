import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'colors_manager.dart';

abstract final class AppTextStyles {
  static TextStyle headlineLarge = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeight.bold,
    color: ColorsManager.textPrimary,
  );

  static TextStyle headlineMedium = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.w700,
    color: ColorsManager.textPrimary,
  );

  static TextStyle titleLarge = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: ColorsManager.textPrimary,
  );
  static TextStyle bodyLarge = TextStyle(
    fontSize: 16.sp,
    color: ColorsManager.textPrimary,
  );
  static TextStyle bodyMedium = TextStyle(
    fontSize: 14.sp,
    color: ColorsManager.textSecondary,
  );
  static TextStyle labelLarge = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
}
