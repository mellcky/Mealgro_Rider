import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mealgro_rider_app/app/theme/app_colors.dart';
import 'package:mealgro_rider_app/app/theme/app_dimensions.dart';
import 'package:mealgro_rider_app/app/theme/app_text_styles.dart';

/// Reusable pill-shaped tab bar.
///
/// Must be placed inside a [DefaultTabController] (or [TabController] via
/// [DefaultTabController.of]). Caller supplies a list of [Tab] widgets so
/// any combination of text-only or icon+text tabs is supported.
///
/// Optional [badges] list maps 1-to-1 with [tabs]: a non-null int renders a
/// red count badge next to the label. Pass `0` to show a dot-only badge.
///
/// Example:
/// ```dart
/// PillTabBar(
///   badges: [4, null, null],
///   tabs: [
///     Tab(text: 'New', height: 36),
///     Tab(text: 'Pending', height: 36),
///     Tab(text: 'All', height: 36),
///   ],
/// )
/// ```
class PillTabBar extends StatelessWidget {
  const PillTabBar({
    super.key,
    required this.tabs,
    this.indicatorColor = AppColors.white,
    this.badges,
  });

  final List<Tab> tabs;

  /// Background colour of the selected pill. Defaults to white.
  final Color indicatorColor;

  /// Optional badge counts, aligned by index to [tabs].
  /// A non-null value renders a red badge; `0` renders a dot.
  final List<int?>? badges;

  // Wraps a tab's label in a Row with an optional red badge.
  Tab _wrapBadge(Tab tab, int? badge) {
    if (badge == null) return tab;

    final label = tab.text != null
        ? Text(tab.text!)
        : (tab.child ?? const SizedBox.shrink());

    return Tab(
      height: tab.height,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          label,
          SizedBox(width: 4.w),
          _PillBadge(count: badge),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final resolvedTabs = badges != null
        ? List.generate(
            tabs.length,
            (i) => _wrapBadge(tabs[i], i < badges!.length ? badges![i] : null),
          )
        : tabs;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimensions.screenPaddingH.w),
      child: Container(
        height: 44.h,
        decoration: BoxDecoration(
          color: AppColors.grey200,
          borderRadius: BorderRadius.circular(AppDimensions.radiusL.r),
        ),
        child: TabBar(
          tabs: resolvedTabs,
          indicator: BoxDecoration(
            color: indicatorColor,
            borderRadius: BorderRadius.circular(AppDimensions.radiusL.r),
            boxShadow: const [
              BoxShadow(
                color: AppColors.boxShadow,
                blurRadius: 4,
                offset: Offset(0, 1),
              ),
            ],
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          dividerColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          labelColor: AppColors.textPrimary,
          unselectedLabelColor: AppColors.textSecondary,
          labelStyle: AppTextStyles.bodyM.copyWith(
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: AppTextStyles.bodyM,
        ),
      ),
    );
  }
}

// ── Badge chip ────────────────────────────────────────────────────────────────

class _PillBadge extends StatelessWidget {
  const _PillBadge({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    final label = count > 0 ? count.toString() : '';
    final isDot = count == 0;

    return Container(
      height: 18.r,
      width: isDot ? 8.r : null,
      constraints: isDot ? null : BoxConstraints(minWidth: 18.r),
      padding: isDot ? EdgeInsets.zero : EdgeInsets.symmetric(horizontal: 5.w),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(99.r),
      ),
      alignment: Alignment.center,
      child: isDot
          ? null
          : Text(
              label,
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.white,
                height: 1,
              ),
            ),
    );
  }
}
