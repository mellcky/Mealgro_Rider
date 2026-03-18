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

/// "Where are you from?" — external rider company info screen.
///
/// Design: Onboarding > External delivery service (Figma frame 390×844)
class WhereAreYouFromScreen extends ConsumerStatefulWidget {
  const WhereAreYouFromScreen({super.key});

  @override
  ConsumerState<WhereAreYouFromScreen> createState() =>
      _WhereAreYouFromScreenState();
}

class _WhereAreYouFromScreenState extends ConsumerState<WhereAreYouFromScreen> {
  final _companyNameController = TextEditingController();
  final _registrationController = TextEditingController();
  final _addressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _companyNameController.dispose();
    _registrationController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  void _handleContinue() {
    if (_formKey.currentState?.validate() ?? false) {
      ref.read(authProvider.notifier).setCompanyInfo(
            companyName: _companyNameController.text.trim(),
            registrationNumber: _registrationController.text.trim(),
            companyAddress: _addressController.text.trim(),
          );
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
            // ── Red header with watermark ─────────────────────────────
            const AuthRedHeader(),

            // ── White form section ────────────────────────────────────
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

                        // ── Title ───────────────────────────────────────
                        Text(
                          'Where are you from?',
                          textAlign: TextAlign.center,
                          style:
                              AppTextStyles.headingXL.copyWith(fontSize: 22.sp),
                        ),

                        SizedBox(height: 4.h),

                        // ── Subtitle ────────────────────────────────────
                        Text(
                          'Tell us about yourself',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.bodyS.copyWith(
                            color: AppColors.textSecondary,
                            fontSize: 13.sp,
                          ),
                        ),

                        SizedBox(height: 70.h),

                        // ── Name of company ─────────────────────────────
                        AppTextField(
                          hint: 'Name of company',
                          controller: _companyNameController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          prefixIcon: SvgPicture.asset(
                            'assets/icons/name_of_company_icon.svg',
                            height: AppDimensions.iconM.r,
                            width: AppDimensions.iconM.r,
                            fit: BoxFit.contain,
                          ),
                        ),

                        SizedBox(height: 18.h),

                        // ── Registration Number ─────────────────────────
                        AppTextField(
                          hint: 'Registration Number',
                          controller: _registrationController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          prefixIcon: SvgPicture.asset(
                            'assets/icons/File_Text_icon.svg',
                            height: AppDimensions.iconM.r,
                            width: AppDimensions.iconM.r,
                            fit: BoxFit.contain,
                          ),
                        ),

                        SizedBox(height: 18.h),

                        // ── Company address ─────────────────────────────
                        AppTextField(
                          hint: 'Company address',
                          controller: _addressController,
                          keyboardType: TextInputType.streetAddress,
                          textInputAction: TextInputAction.done,
                          prefixIcon: SvgPicture.asset(
                            'assets/icons/Map_Point_icon.svg',
                            height: AppDimensions.iconM.r,
                            width: AppDimensions.iconM.r,
                            fit: BoxFit.contain,
                          ),
                        ),

                        SizedBox(height: 28.h),

                        // ── Continue button ─────────────────────────────
                        AuthContinueButton(onPressed: _handleContinue),

                        SizedBox(
                          height: MediaQuery.of(context).padding.bottom + 104.h,
                        ),

                        // ── Privacy footer ──────────────────────────────
                        const AuthPrivacyFooter(),

                        SizedBox(
                          height: MediaQuery.of(context).padding.bottom + 16.h,
                        ),
                      ],
                    ),
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
