import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mealgro_rider_app/app/theme/app_colors.dart';
import 'package:mealgro_rider_app/app/theme/app_dimensions.dart';
import 'package:mealgro_rider_app/app/theme/app_text_styles.dart';

/// Rider type — used by [RiderTypeToggle] and any screen that needs it.
enum RiderType { mealgro, external }

/// Pill-shaped segmented toggle for choosing rider type.
class RiderTypeToggle extends StatelessWidget {
  const RiderTypeToggle({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  final RiderType selected;
  final ValueChanged<RiderType> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 63.69.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppDimensions.radiusCircle.r),
        border: Border.all(color: AppColors.grey300, width: 1),
      ),
      child: Row(
        children: [
          _ToggleOption(
            label: 'Mealgro rider',
            isActive: selected == RiderType.mealgro,
            onTap: () => onChanged(RiderType.mealgro),
          ),
          _ToggleOption(
            label: 'External rider',
            isActive: selected == RiderType.external,
            onTap: () => onChanged(RiderType.external),
          ),
        ],
      ),
    );
  }
}

// ── Private toggle option ────────────────────────────────────────────────────

class _ToggleOption extends StatelessWidget {
  const _ToggleOption({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  final String label;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            color: isActive ? AppColors.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(AppDimensions.radiusCircle.r),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: AppTextStyles.labelL.copyWith(
              color: isActive ? AppColors.white : AppColors.textSecondary,
              fontWeight: FontWeight.w800,
              fontSize: 16.sp,
            ),
          ),
        ),
      ),
    );
  }
}
