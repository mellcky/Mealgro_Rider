import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mealgro_rider_app/app/theme/app_colors.dart';
import 'package:mealgro_rider_app/app/theme/app_text_styles.dart';

/// "Privacy Policy • Terms of Service" footer.
class AuthPrivacyFooter extends StatelessWidget {
  const AuthPrivacyFooter({
    super.key,
    this.onPrivacyTap,
    this.onTermsTap,
  });

  final VoidCallback? onPrivacyTap;
  final VoidCallback? onTermsTap;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: AppTextStyles.labelS.copyWith(
          color: AppColors.textGray,
          fontSize: 11.sp,
        ),
        children: [
          TextSpan(
            text: 'Privacy Policy',
            style: AppTextStyles.labelS.copyWith(
              color: AppColors.textGray,
              fontSize: 11.sp,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()..onTap = onPrivacyTap ?? () {},
          ),
          const TextSpan(text: '  •  '),
          TextSpan(
            text: 'Terms of Service',
            style: AppTextStyles.labelS.copyWith(
              color: AppColors.textGray,
              fontSize: 11.sp,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTermsTap ?? () {},
          ),
        ],
      ),
    );
  }
}
