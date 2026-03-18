import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mealgro_rider_app/app/theme/app_colors.dart';
import 'package:mealgro_rider_app/app/theme/app_dimensions.dart';
import 'package:mealgro_rider_app/app/theme/app_text_styles.dart';

/// Primary continue button used across auth screens.
///
/// Full-width pill button with a centred label and a semi-transparent
/// arrow circle pinned to the right edge.
/// Set [showArrow] to `false` to render a plain centred-label button
/// (e.g. the "Continue to app" button on the success screen).
class AuthContinueButton extends StatelessWidget {
  const AuthContinueButton({
    super.key,
    required this.onPressed,
    this.label = 'Continue',
    this.showArrow = true,
  });

  /// Pass `null` to render the button in its disabled (greyed-out) state.
  final VoidCallback? onPressed;

  /// Button label text. Defaults to 'Continue'.
  final String label;

  /// Whether to show the arrow icon on the right. Defaults to `true`.
  final bool showArrow;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppDimensions.buttonHeight.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          disabledBackgroundColor: AppColors.grey200,
          disabledForegroundColor: AppColors.grey500,
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radiusCircle.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20.w),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Balancing spacer — only needed when arrow is visible
            if (showArrow) SizedBox(width: 32.r),

            // ── Label ─────────────────────────────────────────────────
            Expanded(
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: AppTextStyles.button,
              ),
            ),

            // ── Arrow icon — pinned to right ──────────────────────────
            if (showArrow)
              Container(
                width: 32.r,
                height: 32.r,
                alignment: Alignment.center,
                child: Icon(
                  Icons.arrow_forward_rounded,
                  color:
                      onPressed != null ? AppColors.white : AppColors.grey500,
                  size: 18.r,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
