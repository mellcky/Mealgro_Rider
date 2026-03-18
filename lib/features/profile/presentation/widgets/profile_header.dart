import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mealgro_rider_app/app/theme/app_colors.dart';
import 'package:mealgro_rider_app/app/theme/app_dimensions.dart';
import 'package:mealgro_rider_app/core/constants/app_icons.dart';
import 'dart:math' as math;

/// Red profile header that fills the top section of the profile screen.
///
/// Renders the M / G brand watermarks as background decoration and a
/// semi-transparent back-button in the top-left corner.
class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key, required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      child: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            // ── M watermark (left) ──────────────────────────────────────
            Positioned(
              left: 200.w,
              top: 0,
              bottom: 0,
              child: Transform.rotate(
                angle: 5.00092 * (math.pi / 180),
                child: Transform.scale(
                  scaleX: 1.42, // adjust this value to stretch horizontally

                  child: Image.asset(
                    AppIcons.mWatermark,
                    width: 156.w,
                    height: 160.h,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),

            // ── G watermark (right) ─────────────────────────────────────
            Positioned(
              right: -100.w,
              top: 77.h,
              bottom: 5,
              child: Transform.rotate(
                angle: 1.92 * (math.pi / 180),
                child: Image.asset(
                  AppIcons.gWatermark,
                  width: 330.w,
                ),
              ),
            ),

            // ── Back button ─────────────────────────────────────────────
            Positioned(
              top: AppDimensions.space8.h,
              left: AppDimensions.space16.w,
              child: GestureDetector(
                onTap: onBack,
                child: Container(
                  width: 32.r,
                  height: 32.r,
                  decoration: BoxDecoration(
                    color: AppColors.white.withOpacity(0.25),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.chevron_left,
                    color: AppColors.white,
                    size: 22.r,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
