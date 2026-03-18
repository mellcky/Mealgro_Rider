import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mealgro_rider_app/app/theme/app_colors.dart';
import 'package:mealgro_rider_app/app/theme/app_dimensions.dart';
import 'package:mealgro_rider_app/app/theme/app_text_styles.dart';

/// Full-width "Save changes" button shared across all account-settings screens.
///
/// Renders grey (`AppColors.grey200`) with muted text when [isEnabled] is
/// `false`, and switches to solid red ([AppColors.primary]) with white text
/// once the user has entered valid input — matching the Figma design exactly.
class SaveChangesButton extends StatelessWidget {
  const SaveChangesButton({
    super.key,
    required this.onPressed,
    this.isEnabled = false,
    this.label = 'Save changes',
  });

  final VoidCallback? onPressed;
  final bool isEnabled;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppDimensions.buttonHeight.h,
      child: ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: isEnabled ? AppColors.primary : AppColors.grey200,
          disabledBackgroundColor: AppColors.grey200,
          foregroundColor: isEnabled ? AppColors.white : AppColors.grey600,
          disabledForegroundColor: AppColors.grey600,
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radiusCircle.r),
          ),
        ),
        child: Text(
          label,
          style: AppTextStyles.button.copyWith(
            color: isEnabled ? AppColors.white : AppColors.grey600,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
