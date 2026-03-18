import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mealgro_rider_app/app/theme/app_colors.dart';
import 'package:mealgro_rider_app/app/theme/app_text_styles.dart';
import 'package:mealgro_rider_app/core/constants/app_icons.dart';
import 'package:mealgro_rider_app/features/home/presentation/widgets/delivery_history_section.dart';
import 'package:mealgro_rider_app/features/home/presentation/widgets/home_app_bar.dart';
import 'package:mealgro_rider_app/shared/widgets/earning_card.dart';

// ── Rider data (empty state — no deliveries yet) ──────────────────────────────

const _kRiderName = 'Micheal';
const _kTotalEarned = 'N0.00';

// ── Screen ────────────────────────────────────────────────────────────────────

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      body: SafeArea(
        child: Column(
          children: [
            // ── Top bar ─────────────────────────────────────────────────
            const HomeAppBar(),

            // ── Scrollable body ─────────────────────────────────────────
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 4.h),

                    // Earnings card
                    const EarningCard(
                      riderName: _kRiderName,
                      totalEarned: _kTotalEarned,
                    ),

                    SizedBox(height: 24.h),

                    // Divider matching the design
                    const Divider(
                      height: 1,
                      thickness: 1,
                      color: AppColors.divider,
                    ),

                    SizedBox(height: 16.h),

                    // Delivery history — empty state by default
                    const DeliveryHistorySection(items: []),

                    SizedBox(height: 20.h),

                    // Open map button
                    _OpenMapButton(),

                    SizedBox(height: 28.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Open Map button ───────────────────────────────────────────────────────────

class _OpenMapButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          // TODO: navigate to map screen
        },
        child: SizedBox(
          height: 53.25.h,
          width: 172.w,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.openMapButtonBg,
              borderRadius: BorderRadius.circular(29.63.r),
              border: Border.all(
                color: const Color(0xFFE9E4E4),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppIcons.map,
                  width: 24.r,
                  height: 24.r,
                  // colorFilter: const ColorFilter.mode(
                  //   AppColors.textPrimary,
                  //   BlendMode.srcIn,
                  // ),
                ),
                SizedBox(width: 8.w),
                Text(
                  'Open map',
                  style: AppTextStyles.labelL.copyWith(
                    fontSize: 16.sp,
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}