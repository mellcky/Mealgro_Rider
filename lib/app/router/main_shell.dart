import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mealgro_rider_app/app/theme/app_colors.dart';
import 'package:mealgro_rider_app/app/theme/app_text_styles.dart';
import 'package:mealgro_rider_app/core/constants/app_icons.dart';

// Root scaffold for the 5 bottom-nav tabs (Home / Earnings / Orders / Requests / Profile).
// Wraps StatefulNavigationShell so each tab preserves its own navigation stack.
class MainShell extends StatelessWidget {
  const MainShell({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: _BottomNav(
        currentIndex: navigationShell.currentIndex,
        onTap: (index) => navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        ),
      ),
    );
  }
}

class _BottomNav extends StatelessWidget {
  const _BottomNav({required this.currentIndex, required this.onTap});

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        // border: Border(top: BorderSide(color: AppColors.divider)),
         boxShadow: [
      BoxShadow(
        color: Color(0x1A000000),
        blurRadius: 2,
        offset: Offset(0, -2), // negative y pushes shadow upward
      ),
    ],
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.grey600,
        backgroundColor: AppColors.white,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedLabelStyle: AppTextStyles.labelS.copyWith(
          color: AppColors.primary,
        ),
        unselectedLabelStyle: AppTextStyles.labelS,
        items: const [
          // ── 0 · Home ──────────────────────────────────────────────────
          BottomNavigationBarItem(
            label: 'Home',
            icon: _NavIcon(
              assetPath: AppIcons.homeSmile,
              color: AppColors.grey600,
            ),
            activeIcon: _NavIcon(
              assetPath: AppIcons.homeSmile,
              color: AppColors.primary,
            ),
          ),

          // ── 1 · Earnings ──────────────────────────────────────────────
          BottomNavigationBarItem(
            label: 'Earnings',
            icon: _NavIcon(
              assetPath: AppIcons.usersGroupTwoRounded,
              color: AppColors.grey600,
            ),
            activeIcon: _NavIcon(
              assetPath: AppIcons.usersGroupTwoRounded,
              color: AppColors.primary,
            ),
          ),

          // ── 2 · orders ────────────────────────────────────────────────
          BottomNavigationBarItem(
            label: 'orders',
            icon: _NavIcon(
              assetPath: AppIcons.bagSmile,
              // color: AppColors.grey600,
            ),
            activeIcon: _NavIcon(
              assetPath: AppIcons.bagSmile,
              color: AppColors.primary,
            ),
          ),

          // ── 3 · Requests ──────────────────────────────────────────────
          BottomNavigationBarItem(
            label: 'Requests',
            icon: _NavIcon(
              assetPath: AppIcons.compass,
              color: AppColors.grey600,
            ),
            activeIcon: _NavIcon(
              assetPath: AppIcons.compass,
              color: AppColors.primary,
            ),
          ),

          // ── 4 · Profile ───────────────────────────────────────────────
          BottomNavigationBarItem(
            label: 'Profile',
            icon: _NavIcon(
              assetPath: AppIcons.userCircle,
              color: AppColors.grey600,
            ),
            activeIcon: _NavIcon(
              assetPath: AppIcons.userCircle,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Helpers
// ─────────────────────────────────────────────────────────────────────────────

/// Plain SVG nav icon with an optional colour tint.
class _NavIcon extends StatelessWidget {
  const _NavIcon({required this.assetPath, this.color});

  final String assetPath;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetPath,
      width: 24.r,
      height: 24.r,
      colorFilter:
          color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
    );
  }
}

/// SVG nav icon with a small red badge in the top-right corner.
class _BadgedNavIcon extends StatelessWidget {
  const _BadgedNavIcon({
    required this.assetPath,
    required this.color,
    required this.badgeCount,
  });

  final String assetPath;
  final Color? color;
  final int badgeCount;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SvgPicture.asset(
          assetPath,
          width: 24.r,
          height: 24.r,
          colorFilter:
              color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
        ),
        Positioned(
          top: -4.r,
          right: -6.r,
          child: Container(
            padding: EdgeInsets.all(3.r),
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            constraints: BoxConstraints(
              minWidth: 15.r,
              minHeight: 15.r,
            ),
            child: Text(
              '$badgeCount',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.white,
                fontSize: 8.sp,
                fontWeight: FontWeight.w700,
                height: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
