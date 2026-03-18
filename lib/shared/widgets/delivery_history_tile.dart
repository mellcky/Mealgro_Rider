import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mealgro_rider_app/app/theme/app_colors.dart';
import 'package:mealgro_rider_app/app/theme/app_text_styles.dart';
import 'package:mealgro_rider_app/core/constants/app_icons.dart';

/// Delivery status used by [DeliveryHistoryTile].
enum DeliveryStatus { success, failed }

/// Reusable row tile for delivery history lists.
///
/// Used on both the Home screen preview and the full Delivery History screen.
class DeliveryHistoryTile extends StatelessWidget {
  const DeliveryHistoryTile({
    super.key,
    required this.restaurantName,
    required this.subtitle,
    required this.status,
  });

  /// e.g. `'The place restaurant'`
  final String restaurantName;

  /// e.g. `'3 items · ₦15,000 · Sun, 3rd Oct 2025'`
  final String subtitle;

  final DeliveryStatus status;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        children: [
          // ── Thumbnail ─────────────────────────────────────────────────
          Container(
            width: 48.r,
            height: 48.r,
            decoration: BoxDecoration(
              color: AppColors.grey100,
              borderRadius: BorderRadius.circular(10.r),
            ),
            padding: EdgeInsets.all(6.r),
            child: SvgPicture.asset(
              AppIcons.deliveryPreviewHistory,
              fit: BoxFit.contain,
            ),
          ),

          SizedBox(width: 12.w),

          // ── Details ───────────────────────────────────────────────────
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  restaurantName,
                  style: AppTextStyles.labelL.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 2.h),
                Text(
                  subtitle,
                  style: AppTextStyles.labelS.copyWith(
                    color: AppColors.textSecondary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          SizedBox(width: 8.w),

          // ── Status badge ──────────────────────────────────────────────
          SvgPicture.asset(
            status == DeliveryStatus.success
                ? AppIcons.successTickCircular
                : AppIcons.deliveryHistoryFailed,
            width: 32.r,
            height: 32.r,
          ),
        ],
      ),
    );
  }
}
