import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mealgro_rider_app/app/router/route_paths.dart';
import 'package:mealgro_rider_app/app/theme/app_colors.dart';
import 'package:mealgro_rider_app/app/theme/app_dimensions.dart';
import 'package:mealgro_rider_app/app/theme/app_text_styles.dart';
import 'package:mealgro_rider_app/core/widgets/app_text_field.dart';
import 'package:mealgro_rider_app/features/auth/presentation/widgets/auth_continue_button.dart';
import 'package:mealgro_rider_app/features/auth/presentation/widgets/auth_or_divider.dart';
import 'package:mealgro_rider_app/features/auth/presentation/widgets/auth_privacy_footer.dart';
import 'package:mealgro_rider_app/features/auth/presentation/widgets/auth_red_header.dart';
import 'package:mealgro_rider_app/features/auth/presentation/widgets/auth_sign_in_text.dart';
import 'package:mealgro_rider_app/features/auth/presentation/widgets/auth_social_button.dart';
import 'package:mealgro_rider_app/features/auth/presentation/widgets/rider_type_toggle.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mealgro_rider_app/features/auth/presentation/providers/auth_provider.dart';

/// Welcome / Sign-up screen — "Let's get you set up"
///
/// Design: Onboarding > Register (Figma frame 390×844)
class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  RiderType _riderType = RiderType.mealgro;

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  // ── Build ──────────────────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    // Force light status-bar icons (white) over the red header.
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Column(
          children: [
            // ── Red header with watermark ─────────────────────────────────
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
                child: Form(
                  key: _formKey,
                  child: _FormContent(
                    riderType: _riderType,
                    onRiderTypeChanged: (t) =>
                        setState(() => _riderType = t), // RiderType
                    nameController: _nameController,
                    emailController: _emailController,
                    phoneController: _phoneController,
                    onContinue: _handleContinue,
                    onSignIn: () => context.go(RoutePaths.loginEmail),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleContinue() {
    if (_formKey.currentState?.validate() ?? false) {
      ref.read(authProvider.notifier)
        ..setRiderType(_riderType)
        ..setRegistrationData(
          name: _nameController.text.trim(),
          email: _emailController.text.trim(),
          phone: _phoneController.text.trim(),
        );
      context.go(RoutePaths.verifyEmail);
    }
  }
}

// ── Form Content ─────────────────────────────────────────────────────────────

class _FormContent extends StatelessWidget {
  const _FormContent({
    required this.riderType,
    required this.onRiderTypeChanged,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.onContinue,
    required this.onSignIn,
  });

  final RiderType riderType;
  final ValueChanged<RiderType> onRiderTypeChanged;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final VoidCallback onContinue;
  final VoidCallback onSignIn;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.screenPaddingHLarge.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 28.h),

          // ── Title ─────────────────────────────────────────────────────
          Text(
            "Let's get you set up",
            textAlign: TextAlign.center,
            style: AppTextStyles.headingXL.copyWith(fontSize: 22.sp),
          ),

          SizedBox(height: 4.h),

          // ── Subtitle ──────────────────────────────────────────────────
          Text(
            'Create your unique account',
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyS.copyWith(
              color: AppColors.textSecondary,
              fontSize: 13.sp,
            ),
          ),

          SizedBox(height: 22.h),

          // ── "Sign up as a" label ──────────────────────────────────────
          Center(
            child: Text(
              'Sign up as a',
              style: AppTextStyles.bodyS.copyWith(
                color: AppColors.textGray,
              ),
            ),
          ),

          SizedBox(height: 10.h),

          // ── Rider-type toggle ─────────────────────────────────────────
          RiderTypeToggle(
            selected: riderType,
            onChanged: onRiderTypeChanged,
          ),

          SizedBox(height: 20.h),

          // ── Name ──────────────────────────────────────────────────────
          AppTextField(
            hint: 'Name',
            controller: nameController,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            prefixIcon: SvgPicture.asset(
              'assets/icons/User Rounded.svg',
              height: AppDimensions.iconM.r,
              width: AppDimensions.iconM.r,
              fit: BoxFit.contain,
            ),
          ),

          SizedBox(height: 18.h),

          // ── Email ─────────────────────────────────────────────────────
          AppTextField(
            hint: 'Email',
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            prefixIcon: SvgPicture.asset(
              'assets/icons/Letter.svg',
              height: AppDimensions.iconM.r,
              width: AppDimensions.iconM.r,
              fit: BoxFit.contain,
            ),
          ),

          SizedBox(height: 18.h),

          // ── Phone ─────────────────────────────────────────────────────
          AppTextField(
            hint: 'Phone number',
            controller: phoneController,
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.done,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            prefixIcon: SvgPicture.asset(
              'assets/icons/Phone Rounded.svg',
              height: AppDimensions.iconM.r,
              width: AppDimensions.iconM.r,
              fit: BoxFit.contain,
            ),
          ),

          SizedBox(height: 28.h),

          // ── Continue button ───────────────────────────────────────────
          AuthContinueButton(onPressed: onContinue),

          SizedBox(height: 16.h),

          // ── Sign In link ──────────────────────────────────────────────
          AuthSignInText(onSignIn: onSignIn),

          SizedBox(height: 20.h),

          // ── OR divider ────────────────────────────────────────────────
          const AuthOrDivider(),

          SizedBox(height: 20.h),

          // ── Social buttons ────────────────────────────────────────────
          Row(
            children: [
              Expanded(child: AuthSocialButton.apple()),
              SizedBox(width: 12.w),
              Expanded(child: AuthSocialButton.google()),
            ],
          ),

          SizedBox(height: 24.h),

          // ── Privacy footer ────────────────────────────────────────────
          const AuthPrivacyFooter(),

          SizedBox(
            height: MediaQuery.of(context).padding.bottom + 16.h,
          ),
        ],
      ),
    );
  }
}
