import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mealgro_rider_app/app/theme/app_colors.dart';
import 'package:mealgro_rider_app/app/theme/app_dimensions.dart';
import 'package:mealgro_rider_app/app/theme/app_text_styles.dart';

/// Label + framed input row used on Change-Email and Change-Phone screens.
///
/// Renders a small label above a grey container that contains a leading SVG
/// icon, an expandable [TextField], and an optional green tick badge on the
/// right-hand side when [showValidCheck] is `true`.
class AccountSettingsLabeledField extends StatelessWidget {
  const AccountSettingsLabeledField({
    super.key,
    required this.label,
    required this.iconPath,
    this.controller,
    this.readOnly = false,
    this.hintText,
    this.keyboardType,
    this.showValidCheck = false,
    this.onChanged,
  });

  final String label;
  final String iconPath;
  final TextEditingController? controller;
  final bool readOnly;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool showValidCheck;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: AppTextStyles.labelM.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: 6.h),
        Container(
          height: 54.h,
          decoration: BoxDecoration(
            color: AppColors.grey100,
            borderRadius: BorderRadius.circular(AppDimensions.radiusM.r),
            border: Border.all(color: AppColors.inputBorder, width: 1),
          ),
          child: Row(
            children: [
              SizedBox(width: 14.w),
              SvgPicture.asset(
                iconPath,
                width: 20.r,
                height: 20.r,
                colorFilter: const ColorFilter.mode(
                  AppColors.grey600,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: TextField(
                  controller: controller,
                  readOnly: readOnly,
                  enabled: !readOnly,
                  onChanged: onChanged,
                  keyboardType: keyboardType,
                  style: AppTextStyles.bodyM.copyWith(
                    color: readOnly ? AppColors.grey700 : AppColors.textPrimary,
                  ),
                  decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: AppTextStyles.bodyS,
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 4.h),
                  ),
                  cursorColor: AppColors.primary,
                ),
              ),
              if (showValidCheck) ...[
                SizedBox(width: 8.w),
                Container(
                  width: 20.r,
                  height: 20.r,
                  decoration: const BoxDecoration(
                    color: AppColors.successGreen,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.check,
                    color: AppColors.white,
                    size: 13.r,
                  ),
                ),
              ],
              SizedBox(width: 14.w),
            ],
          ),
        ),
      ],
    );
  }
}
