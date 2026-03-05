import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mealgro_rider_app/app/theme/app_colors.dart';
import 'package:mealgro_rider_app/app/theme/app_dimensions.dart';
import 'package:mealgro_rider_app/app/theme/app_text_styles.dart';

/// Reusable text input field for the Mealgro Rider app.
///
/// Supports prefix/suffix icon, hint text, error state,
/// obscure text (passwords), keyboard type, and validation.
class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.onChanged,
    this.validator,
    this.enabled = true,
    this.textInputAction,
    this.onFieldSubmitted,
    this.focusNode,
    this.maxLines = 1,
    this.inputFormatters,
    this.autofillHints,
  });

  final String hint;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final bool enabled;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onFieldSubmitted;
  final FocusNode? focusNode;
  final int maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final Iterable<String>? autofillHints;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    // Use the externally supplied FocusNode or create an internal one.
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    // Only dispose if we own the node (not externally supplied).
    if (widget.focusNode == null) _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.inputHeight.h,
      width: AppDimensions.inputWidth.w,
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
        onChanged: widget.onChanged,
        validator: widget.validator,
        enabled: widget.enabled,
        textInputAction: widget.textInputAction,
        onFieldSubmitted: widget.onFieldSubmitted,
        focusNode: _focusNode,
        maxLines: widget.maxLines,
        inputFormatters: widget.inputFormatters,
        autofillHints: widget.autofillHints,
        cursorColor: Colors.black,
        onTapOutside: (_) => _focusNode.unfocus(),
        style: AppTextStyles.bodyM.copyWith(
          color: const Color(0xFF1E1E1E),
          fontWeight: FontWeight.w300,
          fontSize: 14.sp,
          letterSpacing: 0.25,
        ),
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: AppTextStyles.bodyM.copyWith(
            color: AppColors.textGray,
          ),
          prefixIcon: widget.prefixIcon != null
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  child: widget.prefixIcon,
                )
              : null,
          prefixIconConstraints: BoxConstraints(
            minWidth: AppDimensions.iconM.w + 28.w,
            minHeight: AppDimensions.inputHeight.h,
          ),
          suffixIcon: widget.suffixIcon != null
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  child: widget.suffixIcon,
                )
              : null,
          suffixIconConstraints: BoxConstraints(
            minWidth: AppDimensions.iconM.w + 28.w,
            minHeight: AppDimensions.inputHeight.h,
          ),
          filled: true,
          fillColor: AppColors.white,
          contentPadding: EdgeInsets.symmetric(
            horizontal: AppDimensions.space16.w,
            vertical: 0,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radiusCircle.r),
            borderSide:
                const BorderSide(color: AppColors.inputBorder, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radiusCircle.r),
            borderSide:
                const BorderSide(color: AppColors.inputBorder, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radiusCircle.r),
            borderSide:
                const BorderSide(color: AppColors.inputFocusBorder, width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radiusCircle.r),
            borderSide: const BorderSide(color: AppColors.errorRed, width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radiusCircle.r),
            borderSide: const BorderSide(color: AppColors.errorRed, width: 1),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radiusCircle.r),
            borderSide: const BorderSide(color: AppColors.grey200, width: 1),
          ),
          errorStyle: AppTextStyles.labelM.copyWith(color: AppColors.errorRed),
        ),
      ),
    );
  }
}
