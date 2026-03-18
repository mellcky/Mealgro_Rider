import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mealgro_rider_app/app/theme/app_colors.dart';
import 'package:mealgro_rider_app/app/theme/app_dimensions.dart';
import 'package:mealgro_rider_app/app/theme/app_text_styles.dart';
import 'package:mealgro_rider_app/core/constants/app_icons.dart';
import 'package:mealgro_rider_app/features/profile/features/account_settings/presentation/widgets/account_settings_app_bar.dart';
import 'package:mealgro_rider_app/features/profile/features/account_settings/presentation/widgets/save_changes_button.dart';

class ChangePictureScreen extends StatefulWidget {
  const ChangePictureScreen({super.key});

  @override
  State<ChangePictureScreen> createState() => _ChangePictureScreenState();
}

class _ChangePictureScreenState extends State<ChangePictureScreen> {
  String? _selectedMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AccountSettingsAppBar(title: 'Change picture'),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppDimensions.screenPaddingH.w),
                child: Column(
                  children: [
                    SizedBox(height: 16.h),
                    // ── Profile photo circle ─────────────────────────────
                    Center(
                      child: Container(
                        width: 180.r,
                        height: 180.r,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.grey200,
                            width: 2.r,
                          ),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            AppIcons.changePictureExample,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 32.h),
                    // ── Section label ────────────────────────────────────
                    Align(
                      alignment: Alignment.centerLeft,
                      child:
                          Text('Select method', style: AppTextStyles.headingS),
                    ),
                    SizedBox(height: 20.h),
                    // ── Method options ───────────────────────────────────
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _MethodOption(
                          iconPath: AppIcons.cameraMinimalistic,
                          label: 'Take photo',
                          isSelected: _selectedMethod == 'camera',
                          onTap: () =>
                              setState(() => _selectedMethod = 'camera'),
                        ),
                        SizedBox(width: 24.w),
                        _MethodOption(
                          iconPath: AppIcons.galleryMinimalistic,
                          label: 'From photos',
                          isSelected: _selectedMethod == 'gallery',
                          onTap: () =>
                              setState(() => _selectedMethod = 'gallery'),
                        ),
                        SizedBox(width: 24.w),
                        _MethodOption(
                          iconPath: AppIcons.fileSend,
                          label: 'From files',
                          isSelected: _selectedMethod == 'files',
                          onTap: () =>
                              setState(() => _selectedMethod = 'files'),
                        ),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
            // ── Save button ──────────────────────────────────────────────
            Padding(
              padding: EdgeInsets.fromLTRB(
                AppDimensions.screenPaddingH.w,
                0,
                AppDimensions.screenPaddingH.w,
                AppDimensions.space24.h,
              ),
              child: SaveChangesButton(
                isEnabled: _selectedMethod != null,
                onPressed: () {
                  // TODO: upload selected image via profile provider
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Private widget ─────────────────────────────────────────────────────────────

class _MethodOption extends StatelessWidget {
  const _MethodOption({
    required this.iconPath,
    required this.label,
    required this.onTap,
    this.isSelected = false,
  });

  final String iconPath;
  final String label;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 52.r,
            height: 52.r,
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.primary.withValues(alpha: 0.12)
                  : AppColors.primarySurface,
              shape: BoxShape.circle,
              border: isSelected
                  ? Border.all(color: AppColors.primary, width: 1.5)
                  : null,
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              iconPath,
              width: 24.r,
              height: 24.r,
              colorFilter: ColorFilter.mode(
                isSelected ? AppColors.primary : AppColors.grey700,
                BlendMode.srcIn,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            label,
            style: AppTextStyles.labelM.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
