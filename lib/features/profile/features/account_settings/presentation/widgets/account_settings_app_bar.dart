import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mealgro_rider_app/app/theme/app_colors.dart';
import 'package:mealgro_rider_app/app/theme/app_dimensions.dart';
import 'package:mealgro_rider_app/app/theme/app_text_styles.dart';
import 'package:go_router/go_router.dart';

/// Reusable header used on all account-settings sub-screens.
///
/// Renders a white-circle back-button (matching the home app-bar icon style)
/// followed by a large bold screen title below it — both sit in the Scaffold
/// body so the title can be as large as the Figma design specifies.
class AccountSettingsAppBar extends StatelessWidget {
  const AccountSettingsAppBar({
    super.key,
    required this.title,
    this.onBack,
    this.fallbackRoute,
  });

  final String title;

  /// Custom back handler. Falls back to [Navigator.maybePop] when omitted.
  final VoidCallback? onBack;

  /// Route to navigate to when there is no previous page to pop.
  final String? fallbackRoute;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: AppDimensions.screenPaddingH.w,
        right: AppDimensions.screenPaddingH.w,
        top: AppDimensions.space16.h,
        bottom: AppDimensions.space24.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Back button — white circle + drop shadow ──────────────────
          GestureDetector(
            onTap: onBack ??
                () {
                  if (context.canPop()) {
                    context.pop();
                    return;
                  }

                  if (fallbackRoute != null) {
                    context.go(fallbackRoute!);
                  }
                },
            behavior: HitTestBehavior.opaque,
            child: Container(
              width: 36.r,
              height: 36.r,
              decoration: const BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.boxShadow,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Icon(
                Icons.chevron_left,
                size: 22.r,
                color: AppColors.textPrimary,
              ),
            ),
          ),

          SizedBox(height: 20.h),

          // ── Screen title ──────────────────────────────────────────────
          Text(title, style: AppTextStyles.headingXL),
        ],
      ),
    );
  }
}
