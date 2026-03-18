import 'package:flutter/material.dart';

import 'package:mealgro_rider_app/app/router/route_paths.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mealgro_rider_app/app/theme/app_colors.dart';
import 'package:mealgro_rider_app/app/theme/app_dimensions.dart';
import 'package:mealgro_rider_app/app/theme/app_text_styles.dart';
import 'package:mealgro_rider_app/core/widgets/pill_tab_bar.dart';
import 'package:mealgro_rider_app/features/profile/features/account_settings/presentation/widgets/account_settings_app_bar.dart';

class DeliveryHistoryScreen extends StatelessWidget {
  const DeliveryHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // top app bar with back button and title
              const AccountSettingsAppBar(
                title: 'Delivery History',
                fallbackRoute: RoutePaths.profile,
              ),

              // ── Pill-style tab bar ────────────────────────────────────
              PillTabBar(
                tabs: [
                  Tab(text: 'All', height: 36.h),
                  Tab(text: 'Successful', height: 36.h),
                  Tab(text: 'Failed', height: 36.h),
                ],
              ),

              SizedBox(height: AppDimensions.space16.h),

              // ── Swipeable tab content ─────────────────────────────────
              const Expanded(
                child: TabBarView(
                  children: [
                    _DeliveryList(filter: _DeliveryFilter.all),
                    _DeliveryList(filter: _DeliveryFilter.successful),
                    _DeliveryList(filter: _DeliveryFilter.failed),
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

// ── Filter enum ────────────────────────────────────────────────────────────────

enum _DeliveryFilter { all, successful, failed }

// ── Tab content placeholder ────────────────────────────────────────────────────

class _DeliveryList extends StatelessWidget {
  const _DeliveryList({required this.filter});

  final _DeliveryFilter filter;

  @override
  Widget build(BuildContext context) {
    // TODO: replace with real list from deliveryHistoryProvider
    return Center(
      child: Text(
        'No ${filter.name} deliveries yet.',
        style: AppTextStyles.bodyM.copyWith(color: AppColors.textSecondary),
      ),
    );
  }
}
