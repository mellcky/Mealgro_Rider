import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mealgro_rider_app/app/theme/app_colors.dart';

// Typography scale for Mealgro Rider.
//
// All font sizes use .sp so they scale relative to the 390x844 design frame.
// These are getters (not const) because .sp is computed at runtime.
//
// Usage:  Text('Hello', style: AppTextStyles.headingXL)
abstract final class AppTextStyles {
  static const String _font = 'Inter';

  static TextStyle get displayLarge => TextStyle(
        fontFamily: _font,
        fontSize: 32.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
        letterSpacing: -0.5,
        height: 1.2,
      );

  static TextStyle get headingXL => TextStyle(
        fontFamily: _font,
        fontSize: 24.sp,
        fontWeight: FontWeight.w800,
        color: AppColors.textPrimary,
        height: 1.3,
      );

  static TextStyle get headingL => TextStyle(
        fontFamily: _font,
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
        height: 1.3,
      );

  static TextStyle get headingM => TextStyle(
        fontFamily: _font,
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
        height: 1.4,
      );

  static TextStyle get headingS => TextStyle(
        fontFamily: _font,
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
        height: 1.4,
      );

  static TextStyle get bodyL => TextStyle(
        fontFamily: _font,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.textPrimary,
        height: 1.5,
      );

  static TextStyle get bodyM => TextStyle(
        fontFamily: _font,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.textPrimary,
        height: 1.5,
      );

  static TextStyle get bodyS => TextStyle(
        fontFamily: _font,
        fontSize: 14.sp,
        fontWeight: FontWeight.w300,
        color: AppColors.textSecondary,
        height: 1.5,
      );

  static TextStyle get labelL => TextStyle(
        fontFamily: _font,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.textPrimary,
        height: 1.4,
      );

  static TextStyle get labelM => TextStyle(
        fontFamily: _font,
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.textSecondary,
        height: 1.4,
      );

  static TextStyle get labelS => TextStyle(
        fontFamily: _font,
        fontSize: 10.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.textSecondary,
        letterSpacing: 0.4,
        height: 1.4,
      );

  static TextStyle get button => TextStyle(
        fontFamily: _font,
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.textOnPrimary,
        letterSpacing: 0.2,
        height: 1.2,
      );

  static TextStyle get buttonSecondary => TextStyle(
        fontFamily: _font,
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.primary,
        letterSpacing: 0.2,
        height: 1.2,
      );
}
