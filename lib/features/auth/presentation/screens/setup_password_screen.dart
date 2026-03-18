import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mealgro_rider_app/app/router/route_paths.dart';
import 'package:mealgro_rider_app/app/theme/app_colors.dart';
import 'package:mealgro_rider_app/app/theme/app_dimensions.dart';
import 'package:mealgro_rider_app/app/theme/app_text_styles.dart';
import 'package:mealgro_rider_app/core/widgets/app_text_field.dart';
import 'package:mealgro_rider_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:mealgro_rider_app/features/auth/presentation/widgets/auth_continue_button.dart';
import 'package:mealgro_rider_app/features/auth/presentation/widgets/auth_privacy_footer.dart';
import 'package:mealgro_rider_app/features/auth/presentation/widgets/auth_red_header.dart';
import 'package:mealgro_rider_app/features/auth/presentation/widgets/rider_type_toggle.dart';

/// Setup Password screen.
///
/// Design: Onboarding > Setup your password (Figma frame 390×844)
class SetupPasswordScreen extends ConsumerStatefulWidget {
  const SetupPasswordScreen({super.key});

  @override
  ConsumerState<SetupPasswordScreen> createState() =>
      _SetupPasswordScreenState();
}

class _SetupPasswordScreenState extends ConsumerState<SetupPasswordScreen> {
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();

  bool _passwordObscure = true;
  bool _confirmObscure = true;
  bool _passwordHasText = false;
  bool _confirmHasText = false;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      final hasText = _passwordController.text.isNotEmpty;
      if (hasText != _passwordHasText) {
        setState(() => _passwordHasText = hasText);
      }
    });
    _confirmController.addListener(() {
      final hasText = _confirmController.text.isNotEmpty;
      if (hasText != _confirmHasText) {
        setState(() => _confirmHasText = hasText);
      }
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  void _handleContinue() {
    final isExternal = ref.read(authProvider).riderType == RiderType.external;
    if (isExternal) {
      context.go(RoutePaths.whereAreYouFrom);
    } else {
      context.go(RoutePaths.authSuccess);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Column(
          children: [
            // ── Red header ────────────────────────────────────────────────
            const AuthRedHeader(),

            // ── White form section ────────────────────────────────────────
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(24.r),
                  ),
                ),
                child: SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: AppDimensions.screenPaddingHLarge.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 28.h),

                      // ── Title ──────────────────────────────────────────
                      Text(
                        'Setup your password',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.headingXL.copyWith(
                          fontSize: 22.sp,
                        ),
                      ),

                      SizedBox(height: 6.h),

                      // ── Subtitle ───────────────────────────────────────
                      Text(
                        'Secure your account',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.bodyS.copyWith(
                          color: AppColors.textSecondary,
                          fontSize: 13.sp,
                        ),
                      ),

                      SizedBox(height: 64.h),

                      // ── Password field ─────────────────────────────────
                      AppTextField(
                        hint: 'Password',
                        controller: _passwordController,
                        obscureText: _passwordObscure,
                        textInputAction: TextInputAction.next,
                        prefixIcon: SvgPicture.asset(
                          'assets/icons/Lock.svg',
                          height: AppDimensions.iconM.r,
                          width: AppDimensions.iconM.r,
                          fit: BoxFit.contain,
                        ),
                        suffixIcon: _EyeToggle(
                          obscure: _passwordObscure,
                          hasText: _passwordHasText,
                          onToggle: () => setState(
                            () => _passwordObscure = !_passwordObscure,
                          ),
                        ),
                      ),

                      SizedBox(height: 24.h),

                      // ── Confirm Password field ─────────────────────────
                      AppTextField(
                        hint: 'Confirm Password',
                        controller: _confirmController,
                        obscureText: _confirmObscure,
                        textInputAction: TextInputAction.done,
                        prefixIcon: SvgPicture.asset(
                          'assets/icons/Lock.svg',
                          height: AppDimensions.iconM.r,
                          width: AppDimensions.iconM.r,
                          fit: BoxFit.contain,
                        ),
                        suffixIcon: _EyeToggle(
                          obscure: _confirmObscure,
                          hasText: _confirmHasText,
                          onToggle: () => setState(
                            () => _confirmObscure = !_confirmObscure,
                          ),
                        ),
                      ),

                      SizedBox(height: 28.h),

                      // ── Continue button ────────────────────────────────
                      AuthContinueButton(onPressed: _handleContinue),

                      SizedBox(
                        height: MediaQuery.of(context).padding.bottom + 164.h,
                      ),

                      // ── Privacy footer ─────────────────────────────────
                      const AuthPrivacyFooter(),

                      SizedBox(
                        height: MediaQuery.of(context).padding.bottom + 16.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Eye Toggle ────────────────────────────────────────────────────────────────
// Shown as suffix only when the field has text.

class _EyeToggle extends StatelessWidget {
  const _EyeToggle({
    required this.obscure,
    required this.hasText,
    required this.onToggle,
  });

  final bool obscure;
  final bool hasText;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: hasText ? onToggle : null,
      child: Opacity(
        opacity: hasText ? 1.0 : 0.3,
        child: SvgPicture.asset(
          'assets/icons/Eye.svg',
          height: AppDimensions.iconM.r,
          width: AppDimensions.iconM.r,
          fit: BoxFit.contain,
          colorFilter: ColorFilter.mode(
            obscure ? AppColors.grey400 : AppColors.textPrimary,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
