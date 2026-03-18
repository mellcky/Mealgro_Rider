import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mealgro_rider_app/core/constants/app_icons.dart';
import 'package:mealgro_rider_app/app/theme/app_colors.dart';
import 'package:mealgro_rider_app/app/theme/app_dimensions.dart';
import 'package:mealgro_rider_app/app/theme/app_text_styles.dart';

class EarningCard extends StatelessWidget {
  const EarningCard({
    super.key,
    required this.riderName,
    required this.totalEarned,
    this.showWelcomePrefix = true,
    this.onWithdraw,
  });

  /// Rider name shown on the card.
  /// When [showWelcomePrefix] is `true` it renders as "Welcome, $riderName".
  final String riderName;

  /// Pre-formatted earnings string, e.g. `'₦100,000'` or `'₦0.00'`.
  final String totalEarned;

  /// Whether to prepend "Welcome, " before [riderName]. Defaults to `true`
  /// (home screen). Pass `false` for the full-name display on Earnings screen.
  final bool showWelcomePrefix;

  /// When provided a "Withdraw" pill button is shown in the bottom-right of the
  /// card and the delivery character illustration is hidden.
  final VoidCallback? onWithdraw;

  @override
  Widget build(BuildContext context) {
    final displayName = showWelcomePrefix ? 'Welcome, $riderName' : riderName;

    return Container(
      width: double.infinity,
      height: 200.72.h,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(AppDimensions.radiusEarningCard.r),
      ),
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          // ── Text content ──────────────────────────────────────────────
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimensions.space20.w,
              vertical: AppDimensions.space20.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Top: name + role
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      displayName,
                      style: AppTextStyles.headingXL.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(height: AppDimensions.space8.h),
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppIcons.userCheckRounded,
                          width: AppDimensions.iconSm.sp,
                          height: AppDimensions.iconSm.sp,
                          
                        ),
                        SizedBox(width: AppDimensions.space4.w),
                        Text(
                          'Mealgro Rider',
                          style: AppTextStyles.bodyM,
                        ),
                      ],
                    ),
                  ],
                ),

                // Bottom: amount + optional withdraw button
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          totalEarned,
                          style: AppTextStyles.displayLarge.copyWith(
                            color: AppColors.white,
                            fontSize: 40.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: AppDimensions.space4.h),
                        Text(
                          'Earned',
                          style: AppTextStyles.bodyM,
                        ),
                      ],
                    ),
                    if (onWithdraw != null) ...[
                      const Spacer(),
                      _WithdrawButton(onTap: onWithdraw!),
                    ],
                  ],
                ),
              ],
            ),
          ),

          // ── Delivery character PNG (hidden when withdraw button is shown) ──
          if (onWithdraw == null)
            Positioned(
              right: 10,
              top: 60,
              bottom: 0,
              child: Transform.scale(
                scaleX: -1,
                child: SizedBox(
                  width: 85.5.w,
                  height: 85.5.h,
                  child: Image.asset(
                    AppIcons.deliveryCharacterSplash,
                    fit: BoxFit.contain,
                    alignment: Alignment.centerRight,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// ── Private Withdraw button ────────────────────────────────────────────────────

class _WithdrawButton extends StatelessWidget {
  const _WithdrawButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: AppColors.primaryDeep,
          borderRadius: BorderRadius.circular(AppDimensions.radiusCircle.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              AppIcons.cashOut,
              width: 20.r,
              height: 20.r,
              colorFilter: const ColorFilter.mode(
                AppColors.white,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              'Withdraw',
              style: AppTextStyles.button.copyWith(
                fontSize: 14.sp,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
