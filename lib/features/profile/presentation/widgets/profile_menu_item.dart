import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mealgro_rider_app/app/theme/app_colors.dart';
import 'package:mealgro_rider_app/app/theme/app_dimensions.dart';
import 'package:mealgro_rider_app/app/theme/app_text_styles.dart';
import 'package:mealgro_rider_app/core/constants/app_icons.dart';

/// Reusable profile menu row.
///
/// Renders a circular icon container on the left, a label in the middle,
/// and a right-arrow on the right. An optional divider is drawn below the row.
///
/// Set [isDestructive] to `true` for the "Log out" row to tint the icon and
/// label text with the primary (red) brand colour.
class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    super.key,
    required this.label,
    required this.iconPath,
    required this.onTap,
    
  
  });

  final String label;
  final String iconPath;
  final VoidCallback onTap;

 

  
 

  @override
  Widget build(BuildContext context) {
    const Color iconColor = AppColors.grey700;
    const Color labelColor = AppColors.textPrimary;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: onTap,
          splashColor: AppColors.primarySurface,
          highlightColor: AppColors.primarySurface.withValues(alpha: 0.5),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimensions.screenPaddingH.w,
              vertical: AppDimensions.space14.h,
            ),
            child: Row(
              children: [
                // ── Icon in circle ───────────────────────────────────────
                Container(
                  width: 40.r,
                  height: 40.r,
                  decoration: const BoxDecoration(
                    color: AppColors.primarySurface,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    iconPath,
                    width: 20.r,
                    height: 20.r,
                    colorFilter: const ColorFilter.mode(iconColor, BlendMode.srcIn),
                  ),
                ),

                SizedBox(width: AppDimensions.space12.w),

                // ── Label ────────────────────────────────────────────────
                Expanded(
                  child: Text(
                    label,
                    style: AppTextStyles.bodyM.copyWith(color: labelColor),
                  ),
                ),

                // ── Arrow ────────────────────────────────────────────────
                SvgPicture.asset(
                  AppIcons.arrow,
                  width: 20.r,
                  height: 20.r,
                  colorFilter: const ColorFilter.mode(
                    AppColors.grey600,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ),
        ),
      
          Divider(
            height: 1,
            indent: AppDimensions.screenPaddingH.w,
            endIndent: AppDimensions.screenPaddingH.w,
            color: AppColors.divider,
          ),
      ],
    );
  }
}
