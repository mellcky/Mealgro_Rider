import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mealgro_rider_app/app/theme/app_colors.dart';
import 'package:mealgro_rider_app/app/theme/app_text_styles.dart';

/// Horizontal divider with an "or" label — used between form and social logins.
class AuthOrDivider extends StatelessWidget {
  const AuthOrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(color: AppColors.grey200, thickness: 1),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Text(
            'or',
            style: AppTextStyles.bodyS.copyWith(
              color: AppColors.textGray,
              fontSize: 12.sp,
            ),
          ),
        ),
        const Expanded(
          child: Divider(color: AppColors.grey200, thickness: 1),
        ),
      ],
    );
  }
}
