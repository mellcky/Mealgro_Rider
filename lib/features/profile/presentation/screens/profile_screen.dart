import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mealgro_rider_app/app/theme/app_colors.dart';
import 'package:mealgro_rider_app/app/theme/app_dimensions.dart';
import 'package:mealgro_rider_app/features/profile/presentation/widgets/profile_avatar_badge.dart';
import 'package:mealgro_rider_app/features/profile/presentation/widgets/profile_body.dart';
import 'package:mealgro_rider_app/features/profile/presentation/widgets/profile_header.dart';

// -- Layout constants (design-frame pixels, 390�844) --------------------------
const double _kHeaderH = 215.0; // height of the red header section
const double _kAvatarD = 90.0; // avatar circle diameter

/// Root screen for the Profile tab.
///
/// Acts as a pure layout orchestrator � all visual sections are implemented
/// in dedicated widget files under `presentation/widgets/`:
///   � [ProfileHeader]      � red background with M/G watermarks & back button
///   � [ProfileAvatarBadge] � profile photo with external-rider checkmark
///   � [ProfileBody]        � rider name, subtitle, and menu list
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // -- Red header -----------------------------------------------
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: _kHeaderH.h,
            child: ProfileHeader(
              onBack: () => context.canPop() ? context.pop() : null,
            ),
          ),

          // -- White rounded card (scrollable body) ---------------------
          Positioned(
            top: (_kHeaderH - _kAvatarD / 2).h,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(AppDimensions.radiusXL.r),
                ),
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                  top: 45.h,
                  bottom: AppDimensions.space24.h,
                ),
                child: const ProfileBody(),
              ),
            ),
          ),

          // -- Avatar � straddles header / card boundary ----------------
          Positioned(
            top: 75.h,
            left: 0,
            right: 235.w,
            
            child: const Center(child: ProfileAvatarBadge()),
          ),
        ],
      ),
    );
  }
}
