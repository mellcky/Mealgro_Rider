import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mealgro_rider_app/app/theme/app_colors.dart';
import 'package:mealgro_rider_app/core/constants/app_icons.dart';

/// Profile photo in a white-bordered circle with an external-rider
/// checkmark badge overlaid at the bottom-right corner.
///
/// [diameter] controls the overall size of the avatar circle (design default
/// is 90 logical pixels before ScreenUtil scaling).
class ProfileAvatarBadge extends StatelessWidget {
  const ProfileAvatarBadge({
    super.key,
    this.diameter = 134.67,
    this.imageProvider,
  });

  /// Diameter of the avatar circle in design-frame pixels.
  final double diameter;

  /// Custom image to display; falls back to [AppIcons.profilePlaceholder]
  /// when `null`.
  final ImageProvider? imageProvider;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: diameter.r,
      height: diameter.r,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // ── White border ring + photo ──────────────────────────────────
          Container(
            width: diameter.r,
            height: diameter.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.white,
              border: Border.all(color: AppColors.white, width: 10.r),
              // boxShadow: const [
              //   BoxShadow(
              //     color: AppColors.boxShadow,
              //     blurRadius: 8,
              //     offset: Offset(0, 2),
              //   ),
              // ],
            ),
            child: ClipOval(
              child: imageProvider != null
                  ? Image(image: imageProvider!, fit: BoxFit.cover)
                  : Image.asset(
                      AppIcons.profilePlaceholder,
                      fit: BoxFit.cover,
                    ),
            ),
          ),

          // ── External-rider checkmark badge (bottom-right) ─────────────
          Positioned(
            bottom: 47.r,
            right: -17,
            child: Image.asset(
              AppIcons.externalRiderCheckmark,
              width: 33.75.r,
              height: 33.75.r,
            ),
          ),
        ],
      ),
    );
  }
}
