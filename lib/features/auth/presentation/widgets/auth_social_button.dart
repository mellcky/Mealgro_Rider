import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mealgro_rider_app/app/theme/app_colors.dart';
import 'package:mealgro_rider_app/app/theme/app_dimensions.dart';
import 'package:mealgro_rider_app/app/theme/app_text_styles.dart';

/// Outlined social login button with an SVG icon and label.
///
/// Use the named factories for the two pre-configured variants:
/// ```dart
/// AuthSocialButton.apple()
/// AuthSocialButton.google()
/// ```
class AuthSocialButton extends StatelessWidget {
  const AuthSocialButton({
    super.key,
    required this.label,
    required this.icon,
    this.onPressed,
  });

  final String label;
  final Widget icon;
  final VoidCallback? onPressed;

  factory AuthSocialButton.apple({VoidCallback? onPressed}) => AuthSocialButton(
        label: 'Apple',
        onPressed: onPressed,
        icon: SvgPicture.asset(
          'assets/icons/apple.svg',
          height: 20.r,
          width: 20.r,
          fit: BoxFit.contain,
        ),
      );

  factory AuthSocialButton.google({VoidCallback? onPressed}) =>
      AuthSocialButton(
        label: 'Google',
        onPressed: onPressed,
        icon: SvgPicture.asset(
          'assets/icons/google.svg',
          height: 20.r,
          width: 20.r,
          fit: BoxFit.contain,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.buttonHeightSm.h,
      child: OutlinedButton(
        onPressed: onPressed ?? () {},
        style: OutlinedButton.styleFrom(
          backgroundColor: AppColors.white,
          foregroundColor: AppColors.textPrimary,
          elevation: 0,
          side: const BorderSide(color: AppColors.grey300, width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radiusXXL.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: 12.w),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            SizedBox(width: 8.w),
            Text(
              label,
              style: AppTextStyles.bodyM.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
