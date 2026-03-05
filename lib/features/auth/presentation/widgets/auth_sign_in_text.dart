import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mealgro_rider_app/app/theme/app_colors.dart';
import 'package:mealgro_rider_app/app/theme/app_text_styles.dart';

/// "Already have an account? Sign In" rich-text row.
class AuthSignInText extends StatelessWidget {
  const AuthSignInText({super.key, required this.onSignIn});

  final VoidCallback onSignIn;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Already have an account? ',
            style: AppTextStyles.bodyS.copyWith(
              color: AppColors.textSecondary,
              fontSize: 13.sp,
            ),
          ),
          TextSpan(
            text: 'Sign In',
            recognizer: TapGestureRecognizer()..onTap = onSignIn,
            style: AppTextStyles.bodyS.copyWith(
              color: AppColors.primary,
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
