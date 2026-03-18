import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mealgro_rider_app/app/router/route_paths.dart';
import 'package:mealgro_rider_app/app/theme/app_colors.dart';
import 'package:mealgro_rider_app/app/theme/app_dimensions.dart';
import 'package:mealgro_rider_app/core/widgets/pill_tab_bar.dart';
import 'package:mealgro_rider_app/features/profile/features/account_settings/presentation/widgets/account_settings_app_bar.dart';

class RequestsScreen extends StatelessWidget {
  const RequestsScreen({super.key});

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
              // ── App bar with back button ──────────────────────────────
              const AccountSettingsAppBar(
                title: 'Requests',
                fallbackRoute: RoutePaths.home,
              ),

              // ── Pill tab bar (New / Pending / All) ────────────────────
              PillTabBar(
                indicatorColor: const Color(0xFFFFCD29),
                badges: const [4, null, null],
                tabs: [
                  Tab(text: 'New', height: 36.h),
                  Tab(text: 'Pending', height: 36.h),
                  Tab(text: 'All', height: 36.h),
                ],
              ),

              SizedBox(height: AppDimensions.space16.h),

              // ── Tab views ─────────────────────────────────────────────
              const Expanded(
                child: TabBarView(
                  children: [
                    _EmptyTab(),
                    _EmptyTab(),
                    _EmptyTab(),
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

// ── Empty tab placeholder ─────────────────────────────────────────────────────

class _EmptyTab extends StatelessWidget {
  const _EmptyTab();

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
