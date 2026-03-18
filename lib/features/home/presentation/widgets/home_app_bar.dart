import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mealgro_rider_app/app/theme/app_colors.dart';
import 'package:mealgro_rider_app/app/theme/app_text_styles.dart';
import 'package:mealgro_rider_app/core/constants/app_icons.dart';

/// Top app-bar for the Home screen.
///
/// Left: map-pin icon + location text.
/// Right: support icon + bell icon.
class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
    this.location = 'Lagos, Nigeria',
    this.onSupportTap,
    this.onBellTap,
  });

  final String location;
  final VoidCallback? onSupportTap;
  final VoidCallback? onBellTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
      child: Row(
        children: [
          // ── Location ───────────────────────────────────────────────────
          SvgPicture.asset(
            AppIcons.mapPointBroken,
            width: 20.r,
            height: 20.r,
          ),
          SizedBox(width: 5.w),
          Text(
            location,
            style: AppTextStyles.labelL.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w400,
            ),
          ),

          const Spacer(),

          // ── Support ────────────────────────────────────────────────────
          _IconBtn(
            assetPath: AppIcons.ixSupport,
            onTap: onSupportTap,
          ),

          SizedBox(width: 10.w),

          // ── Bell ───────────────────────────────────────────────────────
          _IconBtn(
            assetPath: AppIcons.bell,
            onTap: onBellTap,
          ),
        ],
      ),
    );
  }
}

/// Small tappable icon button with a white rounded-rectangle background.
/// Matches the Figma design where support and bell sit inside white pill cards.
class _IconBtn extends StatelessWidget {
  const _IconBtn({required this.assetPath, this.onTap});

  final String assetPath;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: EdgeInsets.all(8.r),
        decoration: const BoxDecoration(
          color: AppColors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: AppColors.boxShadow,
              blurRadius: 4,
              spreadRadius: 0,
              offset: Offset(0, 4),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: SvgPicture.asset(
          assetPath,
          width: 21.r,
          height: 21.r,
          // colorFilter: const ColorFilter.mode(
          //   AppColors.textPrimary,
          //   BlendMode.srcIn,
          // ),
        ),
      ),
    );
  }
}
