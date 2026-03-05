import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mealgro_rider_app/app/theme/app_colors.dart';
import 'package:mealgro_rider_app/app/theme/app_dimensions.dart';
import 'package:mealgro_rider_app/app/theme/app_text_styles.dart';

/// Custom app bar used across Mealgro Rider screens.
///
/// Pass [onBack] to show a back chevron (auto-pops if null and
/// [Navigator.canPop] is true). Set [actions] for right-side icons.
///
/// The bar applies a [SystemUiOverlayStyle] matching [backgroundColor] —
/// light icons for dark/red backgrounds, dark icons for white/light ones.
class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
    this.title,
    this.titleWidget,
    this.onBack,
    this.showBack = true,
    this.actions,
    this.backgroundColor = AppColors.white,
    this.titleColor,
    this.centerTitle = true,
    this.elevation = 0,
    this.bottom,
  });

  final String? title;
  final Widget? titleWidget;
  final VoidCallback? onBack;
  final bool showBack;
  final List<Widget>? actions;
  final Color backgroundColor;
  final Color? titleColor;
  final bool centerTitle;
  final double elevation;
  final PreferredSizeWidget? bottom;

  // Determine whether the background is "dark" so the status bar icons
  // can be inverted accordingly.
  bool get _isDark {
    final luminance = backgroundColor.computeLuminance();
    return luminance < 0.179;
  }

  @override
  Size get preferredSize => Size.fromHeight(
        AppDimensions.appBarHeight.h + (bottom?.preferredSize.height ?? 0),
      );

  @override
  Widget build(BuildContext context) {
    final textColor =
        titleColor ?? (_isDark ? AppColors.white : AppColors.textPrimary);
    final iconColor = _isDark ? AppColors.white : AppColors.textPrimary;

    final overlayStyle =
        _isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: overlayStyle,
      child: AppBar(
        backgroundColor: backgroundColor,
        elevation: elevation,
        scrolledUnderElevation: 0,
        centerTitle: centerTitle,
        toolbarHeight: AppDimensions.appBarHeight.h,
        automaticallyImplyLeading: false,
        bottom: bottom,
        leading:
            showBack ? _BackButton(onBack: onBack, iconColor: iconColor) : null,
        title: titleWidget ??
            (title != null
                ? Text(
                    title!,
                    style: AppTextStyles.headingS.copyWith(color: textColor),
                  )
                : null),
        actions: actions,
      ),
    );
  }
}

// ── Back Button ──────────────────────────────────────────────────────────────

class _BackButton extends StatelessWidget {
  const _BackButton({this.onBack, required this.iconColor});

  final VoidCallback? onBack;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.w),
      child: IconButton(
        onPressed: onBack ?? () => Navigator.maybePop(context),
        icon: Icon(
          Icons.chevron_left_rounded,
          color: iconColor,
          size: AppDimensions.iconL.r,
        ),
        splashRadius: 20.r,
      ),
    );
  }
}
