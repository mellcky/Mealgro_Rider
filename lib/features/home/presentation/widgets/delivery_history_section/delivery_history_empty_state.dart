import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mealgro_rider_app/app/theme/app_colors.dart';
import 'package:mealgro_rider_app/app/theme/app_text_styles.dart';
import 'package:mealgro_rider_app/core/constants/app_icons.dart';

/// Empty-state widget shown inside the delivery history section when
/// there are no deliveries yet.
class DeliveryHistoryEmptyState extends StatelessWidget {
  const DeliveryHistoryEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Padding(
        padding: EdgeInsets.only(bottom: 8.h),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 26.h),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(14.r),
            boxShadow: const [
              BoxShadow(
                color: Color(0x1A000000),
                blurRadius: 4,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              // empty state delivery history icon
              Image.asset(
                AppIcons.deliveryHistoryEmpty,
                // width: 120.w,
                // height: 120.h,
              ),

              SizedBox(height: 14.h),

              Text(
                'Oops!, no payment has been\nmade to your account yet',
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyS.copyWith(
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 14.h),
            ],
          ),
        ),
      ),
    );
  }
}