import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mealgro_rider_app/app/router/route_paths.dart';
import 'package:mealgro_rider_app/app/theme/app_colors.dart';
import 'package:mealgro_rider_app/app/theme/app_dimensions.dart';
import 'package:mealgro_rider_app/app/theme/app_text_styles.dart';
import 'package:mealgro_rider_app/features/auth/presentation/widgets/auth_continue_button.dart';
import 'package:mealgro_rider_app/features/auth/presentation/widgets/auth_otp_field.dart';
import 'package:mealgro_rider_app/features/auth/presentation/widgets/auth_privacy_footer.dart';
import 'package:mealgro_rider_app/features/auth/presentation/widgets/auth_red_header.dart';

/// Verify Email OTP screen.
///
/// Design: Onboarding > Verify your Email (Figma frame 390×844)
class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  static const int _resendSeconds = 60;

  final _otpController = TextEditingController();
  final _otpFocus = FocusNode();

  bool _isComplete = false;
  int _secondsLeft = _resendSeconds;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    setState(() => _secondsLeft = _resendSeconds);
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (_secondsLeft == 0) {
        t.cancel();
      } else {
        setState(() => _secondsLeft--);
      }
    });
  }

  void _onResend() {
    if (_secondsLeft > 0) return;
    // TODO: trigger resend API call
    _otpController.clear();
    setState(() => _isComplete = false);
    _startTimer();
  }

  void _onOtpCompleted(String pin) {
    setState(() => _isComplete = true);
  }

  void _onOtpChanged(String pin) {
    final complete = pin.length == 4;
    if (complete != _isComplete) setState(() => _isComplete = complete);
  }

  void _handleContinue() {
    if (!_isComplete) return;
    context.go(RoutePaths.setupPassword);
  }

  @override
  void dispose() {
    _timer?.cancel();
    _otpController.dispose();
    _otpFocus.dispose();
    super.dispose();
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

                      // ── Title ────────────────────────────────────────────
                      Text(
                        'Verify your Email',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.headingXL,
                      ),

                      SizedBox(height: 8.h),

                      // ── Subtitle ─────────────────────────────────────────
                      Text(
                        'A 4-digit code has been sent\nto your email',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.bodyS.copyWith(
                          color: AppColors.textSecondary,
                          fontSize: 13.sp,
                        ),
                      ),

                      SizedBox(height: 60.h),

                      // ── OTP field ────────────────────────────────────────
                      AuthOtpField(
                        controller: _otpController,
                        focusNode: _otpFocus,
                        onCompleted: _onOtpCompleted,
                        onChanged: _onOtpChanged,
                      ),

                      SizedBox(height: 36.h),

                      // ── Resend countdown ─────────────────────────────────
                      _ResendRow(
                        secondsLeft: _secondsLeft,
                        onResend: _onResend,
                      ),

                      SizedBox(height: 66.h),

                      // ── Continue button ──────────────────────────────────
                      AuthContinueButton(
                        onPressed: _isComplete ? _handleContinue : null,
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).padding.bottom + 128.h,
                      ),

                      // ── Privacy footer ────────────────────────────────────
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

// ── Resend Row ────────────────────────────────────────────────────────────────

class _ResendRow extends StatelessWidget {
  const _ResendRow({required this.secondsLeft, required this.onResend});

  final int secondsLeft;
  final VoidCallback onResend;

  @override
  Widget build(BuildContext context) {
    final counting = secondsLeft > 0;
    final mm = (secondsLeft ~/ 60).toString().padLeft(2, '0');
    final ss = (secondsLeft % 60).toString().padLeft(2, '0');

    return counting
        ? Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Resend code in ',
                  style: AppTextStyles.bodyS.copyWith(
                    color: AppColors.textSecondary,
                    fontSize: 13.sp,
                  ),
                ),
                TextSpan(
                  text: '$mm:$ss',
                  style: AppTextStyles.bodyS.copyWith(
                    color: AppColors.textSecondary,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          )
        : GestureDetector(
            onTap: onResend,
            child: Text(
              'Resend code',
              style: AppTextStyles.bodyS.copyWith(
                color: AppColors.primary,
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.primary,
              ),
            ),
          );
  }
}
