import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mealgro_rider_app/app/theme/app_colors.dart';
import 'package:mealgro_rider_app/app/theme/app_text_styles.dart';
import 'package:pinput/pinput.dart';

/// 4-cell OTP input field for auth screens.
///
/// Each cell is a rounded-rectangle box that transitions from the default
/// grey border → red border (focused) → filled grey background (submitted).
class AuthOtpField extends StatelessWidget {
  const AuthOtpField({
    super.key,
    required this.controller,
    this.focusNode,
    this.onCompleted,
    this.onChanged,
    this.length = 4,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final ValueChanged<String>? onCompleted;
  final ValueChanged<String>? onChanged;
  final int length;

  @override
  Widget build(BuildContext context) {
    // Each cell: ~68×64 dp — 4 cells + 3×12 gaps fits inside 319 dp content width
    const double cellW = 74;
    const double cellH = 67;
    const double radius = 12;
    const double borderWidth = 1;

    final defaultTheme = PinTheme(
      width: cellW.w,
      height: cellH.h,
      textStyle: AppTextStyles.headingL.copyWith(
        color: AppColors.textPrimary,
        fontWeight: FontWeight.w800,
        fontSize: 32.sp,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(radius.r),
        border: Border.all(color: AppColors.inputBorder, width: borderWidth),
      ),
    );

    final focusedTheme = defaultTheme.copyWith(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(radius.r),
        border: Border.all(color: AppColors.primary, width: borderWidth),
      ),
    );

    final submittedTheme = defaultTheme.copyWith(
      decoration: BoxDecoration(
        color: AppColors.otpSuccessFill,
        borderRadius: BorderRadius.circular(radius.r),
        border:
            Border.all(color: AppColors.otpSuccessBorder, width: borderWidth),
      ),
    );

    return Pinput(
      length: length,
      controller: controller,
      focusNode: focusNode,
      defaultPinTheme: defaultTheme,
      focusedPinTheme: focusedTheme,
      submittedPinTheme: submittedTheme,
      separatorBuilder: (_) => SizedBox(width: 12.w),
      onCompleted: onCompleted,
      onChanged: onChanged,
      showCursor: true,
      cursor: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 20.w,
            height: 2.h,
            color: AppColors.primary,
          ),
          SizedBox(height: 8.h),
        ],
      ),
    );
  }
}
