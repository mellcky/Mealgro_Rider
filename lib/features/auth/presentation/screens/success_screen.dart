import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mealgro_rider_app/app/router/route_paths.dart';
import 'package:mealgro_rider_app/app/theme/app_colors.dart';
import 'package:mealgro_rider_app/app/theme/app_text_styles.dart';
import 'package:mealgro_rider_app/features/auth/presentation/widgets/auth_continue_button.dart';

/// Auth Success — "All done!" screen.
///
/// Design: Onboarding > All done! (Figma frame 390×844)
class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            // ── M ring watermark — bottom-left overflow ───────────────────
            // Figma: left: -4.32, top: 399.96, 604.73×328.87, angle: 39.87°
            Positioned(
              left: -4.32.w,
              top: 399.96.h,
              child: Transform.rotate(
                angle: 39.87 * math.pi / 180,
                alignment: Alignment.topLeft,
                child: SvgPicture.asset(
                  'assets/icons/sucess_mealgro_icon.svg',
                  width: 604.73.w,
                  height: 328.87.h,
                  fit: BoxFit.fill,
                ),
              ),
            ),

            // ── G watermark — bottom-right ────────────────────────────────
            // Figma: left: 189.6, top: 592.79, 253.90×233.86, angle: 39.87°
            Positioned(
              left: 189.6.w,
              top: 592.79.h,
              child: Transform.rotate(
                angle: 39.87 * math.pi / 180,
                alignment: Alignment.topLeft,
                child: SvgPicture.asset(
                  'assets/icons/sucess_mealgro_icon_G.svg',
                  width: 253.90.w,
                  height: 233.86.h,
                  fit: BoxFit.fill,
                ),
              ),
            ),

            // ── Foreground content ────────────────────────────────────────
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 34.w),
                child: Column(
                  children: [
                    const Spacer(flex: 3),

                    // ── MealGro logo — three concentric circles ───────────
                    // Outer ellipse (blush pink) → inner ellipse → red circle
                    Container(
                      width: 235.54.w,
                      height: 235.54.w,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFFFB8B3),
                      ),
                      alignment: Alignment.center,
                      child: Container(
                        width: 184.24.w,
                        height: 184.24.w,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFFF2509),
                        ),
                        alignment: Alignment.center,
                        child: ColorFiltered(
                          colorFilter: const ColorFilter.mode(
                            Colors.white,
                            BlendMode.srcIn,
                          ),
                          child: SvgPicture.asset(
                            'assets/icons/sucess_meal_gro.svg',
                            width: 110.36.w,
                            height: 81.w,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 28.h),

                    // ── "All done!" title ─────────────────────────────────
                    Text(
                      'All done!',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.displayLarge.copyWith(
                        color: AppColors.primary,
                        fontSize: 40.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    const Spacer(flex: 4),

                    // ── Continue to app button ────────────────────────────
                    AuthContinueButton(
                      label: 'Continue to app',
                      onPressed: () => context.go(RoutePaths.home),
                    ),

                    SizedBox(
                      height: MediaQuery.of(context).padding.bottom + 16.h,
                    ),
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
