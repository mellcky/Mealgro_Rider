import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mealgro_rider_app/app/router/route_paths.dart';
import 'package:mealgro_rider_app/app/theme/app_colors.dart';
import 'package:mealgro_rider_app/app/theme/app_dimensions.dart';
import 'package:mealgro_rider_app/app/theme/app_text_styles.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: AppDimensions.space48.h),

            // ── Logo ─────────────────────────────────────────────────────
            Image.asset(
              'assets/icons/spahscreen_mealgro_logo.png',
              height: 72.h,
            ),

            // ── Rider illustration ────────────────────────────────────────
            Expanded(
              child: Image.asset(
                'assets/icons/delivery-character-with-scooter-with-face-mask-3d-illustration 1.png',
                fit: BoxFit.contain,
              ),
            ),

            SizedBox(height: AppDimensions.space24.h),

            // ── Headline + Subtitle + Button (padded) ─────────────────────
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.screenPaddingHLarge.w,
              ),
              child: Column(
                children: [
                  // ── Headline ────────────────────────────────────────────
                  Text(
                    'On-Point Food Delivery',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.displayLarge.copyWith(
                      color: AppColors.white,
                      height: 1.2,
                    ),
                  ),

                  SizedBox(height: AppDimensions.space8.h),

                  // ── Subtitle ─────────────────────────────────────────────
                  Text(
                    'Food Delivery Made Easy',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.bodyL.copyWith(
                      color: AppColors.grey650,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  SizedBox(height: AppDimensions.space32.h),

                  // ── Get Started button ────────────────────────────────────
                  SizedBox(
                    width: double.infinity,
                    height: AppDimensions.buttonHeight.h,
                    child: ElevatedButton(
                      onPressed: () => context.go(RoutePaths.register),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryDeep,
                        // foregroundColor: AppColors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            AppDimensions.radiusCircle.r,
                          ),
                        ),
                      ),
                      child: Text(
                        'Get Started',
                        style: AppTextStyles.button,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: AppDimensions.space32.h),
          ],
        ),
      ),
    );
  }
}
