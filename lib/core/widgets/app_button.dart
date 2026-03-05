import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mealgro_rider_app/app/theme/app_colors.dart';
import 'package:mealgro_rider_app/app/theme/app_dimensions.dart';
import 'package:mealgro_rider_app/app/theme/app_text_styles.dart';

/// Button variant.
///
/// - [primary]  — solid red fill, white text, pill shape (radiusCircle).
/// - [outline]  — white fill, grey border, dark text, rounded corners.
/// - [ghost]    — transparent fill, primary-coloured text, no border.
enum AppButtonVariant { primary, outline, ghost }

/// Reusable button for the Mealgro Rider app.
///
/// ```dart
/// // Primary — full width with trailing arrow
/// AppButton(label: 'Continue', onPressed: _submit,
///   trailingIcon: Icon(Icons.arrow_forward, color: AppColors.white, size: 18.r))
///
/// // Outline — social login with leading asset
/// AppButton(label: 'Google', variant: AppButtonVariant.outline,
///   leadingIcon: Image.asset('assets/icons/welcome_watermark_G.png', height: 20.r))
/// ```
class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.leadingIcon,
    this.trailingIcon,
    this.isLoading = false,
    this.width,
    this.height,
  });

  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final bool isLoading;

  /// Override width. Defaults to [double.infinity] (full-width).
  final double? width;

  /// Override height. Defaults to [AppDimensions.buttonHeight].
  final double? height;

  @override
  Widget build(BuildContext context) {
    final isPrimary = variant == AppButtonVariant.primary;
    final isOutline = variant == AppButtonVariant.outline;

    final bgColor = switch (variant) {
      AppButtonVariant.primary => AppColors.primary,
      AppButtonVariant.outline => AppColors.white,
      AppButtonVariant.ghost => Colors.transparent,
    };

    final fgColor = switch (variant) {
      AppButtonVariant.primary => AppColors.white,
      AppButtonVariant.outline => AppColors.textPrimary,
      AppButtonVariant.ghost => AppColors.primary,
    };

    final borderRadius =
        isPrimary ? AppDimensions.radiusCircle.r : AppDimensions.radiusM.r;

    final labelStyle = switch (variant) {
      AppButtonVariant.primary =>
        AppTextStyles.button.copyWith(color: AppColors.white),
      AppButtonVariant.outline => AppTextStyles.button.copyWith(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w500,
          fontSize: 15.sp,
        ),
      AppButtonVariant.ghost =>
        AppTextStyles.button.copyWith(color: AppColors.primary),
    };

    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? AppDimensions.buttonHeight.h,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: fgColor,
          disabledBackgroundColor: bgColor.withValues(alpha: 0.6),
          elevation: 0,
          shadowColor: Colors.transparent,
          side: isOutline
              ? const BorderSide(color: AppColors.grey300, width: 1)
              : BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
        ),
        child: isLoading
            ? SizedBox(
                width: 20.r,
                height: 20.r,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color: isPrimary ? AppColors.white : AppColors.primary,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (leadingIcon != null) ...[
                    leadingIcon!,
                    SizedBox(width: 8.w),
                  ],
                  Text(label, style: labelStyle),
                  if (trailingIcon != null) ...[
                    SizedBox(width: 8.w),
                    trailingIcon!,
                  ],
                ],
              ),
      ),
    );
  }
}
