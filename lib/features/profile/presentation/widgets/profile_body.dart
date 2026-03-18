import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mealgro_rider_app/app/router/route_paths.dart';
// import 'package:mealgro_rider_app/app/theme/app_colors.dart';
import 'package:mealgro_rider_app/app/theme/app_text_styles.dart';
import 'package:mealgro_rider_app/core/constants/app_icons.dart';
import 'package:mealgro_rider_app/features/profile/features/logout/presentation/widgets/logout_dialog.dart';
import 'package:mealgro_rider_app/features/profile/presentation/widgets/profile_menu_item.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mealgro_rider_app/app/theme/app_dimensions.dart';

/// Scrollable body section of the profile screen.
///
/// Displays the rider's name, role subtitle, and the six menu rows.
/// Receives [riderName] and [riderSubtitle] so the parent can supply real
/// data without this widget knowing about providers.
class ProfileBody extends StatelessWidget {
  const ProfileBody({
    super.key,
    this.riderName = 'Ajayi Micheal',
    this.riderSubtitle = 'External rider  |  JX express',
  });

  final String riderName;
  final String riderSubtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Rider name ───────────────────────────────────────────────────
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 45.w),
          child: Text(
            riderName,
            style: AppTextStyles.headingM.copyWith(
              fontSize: 24.sp,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),

        // ── Rider type / company ─────────────────────────────────────────
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 45.w),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                AppIcons.userCheckRounded,
                width: AppDimensions.iconSm.sp,
                height: AppDimensions.iconSm.sp,
              ),

              SizedBox(width: 4.w),

              Text(riderSubtitle, style: AppTextStyles.bodyS),
            ],
          ),
        ),

        SizedBox(height: 10.h),

        // ── Menu items ───────────────────────────────────────────────────
        ProfileMenuItem(
          label: 'Account settings',
          iconPath: AppIcons.userCheck,
          onTap: () => context.push(RoutePaths.profileSettings),
        ),
        ProfileMenuItem(
          label: 'Delivery History',
          iconPath: AppIcons.bicycling,
          onTap: () => context.go(RoutePaths.history),
        ),
        ProfileMenuItem(
          label: 'Earnings',
          iconPath: AppIcons.chartSquare,
          onTap: () => context.go(RoutePaths.earnings),
        ),
        ProfileMenuItem(
          label: 'Bank Account info',
          iconPath: AppIcons.wallet,
          onTap: () => context.push(RoutePaths.bankAccount),
        ),
        ProfileMenuItem(
          label: 'App settings',
          iconPath: AppIcons.settings,
          onTap: () => context.push(RoutePaths.appSettings),
        ),
        ProfileMenuItem(
          label: 'Log out',
          iconPath: AppIcons.trashBinTrash,
       
         
          onTap: () => LogoutDialog.show(
            context,
            onConfirm: () => context.go(RoutePaths.loginEmail),
          ),
        ),
      ],
    );
  }
}
