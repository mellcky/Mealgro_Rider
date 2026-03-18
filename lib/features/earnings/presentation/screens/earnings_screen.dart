import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mealgro_rider_app/app/router/route_paths.dart';
import 'package:mealgro_rider_app/app/theme/app_colors.dart';
import 'package:mealgro_rider_app/app/theme/app_dimensions.dart';
import 'package:mealgro_rider_app/app/theme/app_text_styles.dart';
import 'package:mealgro_rider_app/core/constants/app_icons.dart';
import 'package:mealgro_rider_app/core/widgets/pill_tab_bar.dart';
import 'package:mealgro_rider_app/shared/widgets/earning_card.dart';

class EarningsScreen extends StatelessWidget {
  const EarningsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Header ─────────────────────────────────────────────────
              Padding(
                padding: EdgeInsets.only(
                  left: AppDimensions.screenPaddingH.w,
                  right: AppDimensions.screenPaddingH.w,
                  top: AppDimensions.space16.h,
                  bottom: AppDimensions.space16.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Red circle back button
                    GestureDetector(
                      onTap: () => Navigator.of(context).maybePop(),
                      behavior: HitTestBehavior.opaque,
                      child: Container(
                        width: 36.r,
                        height: 36.r,
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.chevron_left,
                          size: 22.r,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: AppDimensions.space16.h),
                    Text('Your Earnings', style: AppTextStyles.headingXL),
                  ],
                ),
              ),

              // ── Earnings card ──────────────────────────────────────────
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.screenPaddingH.w,
                ),
                child: EarningCard(
                  riderName: 'Ajayi Micheal',
                  totalEarned: 'N 0.00',
                  showWelcomePrefix: false,
                  onWithdraw: () => context
                      .push(RoutePaths.withdrawals), // TODO: wire provider
                ),
              ),

              SizedBox(height: AppDimensions.space24.h),

              // ── Pill tab bar ───────────────────────────────────────────
              PillTabBar(
                tabs: [
                  Tab(
                    height: 36.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          AppIcons.chartSquare,
                          width: 16.r,
                          height: 16.r,
                          colorFilter: const ColorFilter.mode(
                            AppColors.grey700,
                            BlendMode.srcIn,
                          ),
                        ),
                        SizedBox(width: 6.w),
                        const Text('Earnings'),
                      ],
                    ),
                  ),
                  Tab(
                    height: 36.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          AppIcons.cashOut,
                          width: 16.r,
                          height: 16.r,
                          colorFilter: const ColorFilter.mode(
                            AppColors.grey700,
                            BlendMode.srcIn,
                          ),
                        ),
                        SizedBox(width: 6.w),
                        const Text('Withdrawals'),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: AppDimensions.space16.h),

              // ── Swipeable tab content ──────────────────────────────────
              const Expanded(
                child: TabBarView(
                  children: [
                    _EarningsTab(),
                    _WithdrawalsTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Tab content ────────────────────────────────────────────────────────────────

class _EarningsTab extends StatelessWidget {
  const _EarningsTab();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimensions.screenPaddingH.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Earnings history', style: AppTextStyles.headingS),
          SizedBox(height: AppDimensions.space16.h),
          // TODO: replace with real earnings list from earningsProvider
          Expanded(
            child: Center(
              child: Text(
                'No earnings yet.',
                style: AppTextStyles.bodyM.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _WithdrawalsTab extends StatelessWidget {
  const _WithdrawalsTab();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimensions.screenPaddingH.w),
      child: Center(
        child: Text(
          'No withdrawals yet.',
          style: AppTextStyles.bodyM.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ),
    );
  }
}
