import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mealgro_rider_app/app/theme/app_colors.dart';
import 'package:mealgro_rider_app/app/theme/app_text_styles.dart';
import 'package:mealgro_rider_app/features/home/presentation/widgets/delivery_history_section/delivery_history_empty_state.dart';
import 'package:mealgro_rider_app/features/home/presentation/widgets/delivery_history_section/delivery_history_item.dart';
import 'package:mealgro_rider_app/features/home/presentation/widgets/delivery_history_section/delivery_history_list.dart';

// Re-export so callers only need to import this one file.
export 'delivery_history_section/delivery_history_item.dart';

/// Home-screen section: "Delivery History" header + list (or empty state).
///
/// Pass an empty [items] list to render the cash-icon empty state.
/// Pass [onSeeAll] to handle the circular-arrow "see all" button tap.
class DeliveryHistorySection extends StatelessWidget {
  const DeliveryHistorySection({
    super.key,
    required this.items,
    this.onSeeAll,
  });

  final List<DeliveryHistoryItem> items;
  final VoidCallback? onSeeAll;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ── Section header ──────────────────────────────────────────────
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // "Delivery History" pill badge
              Container(
                width: 140.44.w,
                height: 38.85.h,
                padding: EdgeInsets.symmetric(
                  horizontal: 14.w,
                  vertical: 7.h,
                ),
                decoration: BoxDecoration(
                  color: AppColors.deliveyHistoryButtonBg,
                  borderRadius: BorderRadius.circular(19.43.r),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Delivery History',
                  style: AppTextStyles.labelL.copyWith(
                    color: AppColors.deliveyHistoryText,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              // Chevron "see all" button
              GestureDetector(
                onTap: onSeeAll,
                behavior: HitTestBehavior.opaque,
                child: Container(
                  width: 32.r,
                  height: 32.r,
                  decoration: BoxDecoration(
                    color: AppColors.grey300,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black.withValues(alpha: 0.06),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.chevron_right_rounded,
                    size: 18.r,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 15.h),

        // Divider
        Container(
          width: 292.33.w,
          height: 1,
          margin: EdgeInsets.symmetric(horizontal: 32.w),
          color: AppColors.divider,
        ),

        // ── Content ─────────────────────────────────────────────────────
        if (items.isEmpty)
          const DeliveryHistoryEmptyState()
        else
          DeliveryHistoryList(items: items),
      ],
    );
  }
}
