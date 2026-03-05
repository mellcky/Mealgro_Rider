import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Shared red header used across auth screens (Register, OTP, etc.).
///
/// Renders the two brand watermarks inside a clipped red area.
/// Wrap the parent [Scaffold] with [backgroundColor: AppColors.primary] so
/// the header blends seamlessly into the scaffold background.
class AuthRedHeader extends StatelessWidget {
  const AuthRedHeader({super.key, this.height});

  /// Override height in logical pixels (before .h scaling).
  /// Defaults to 140.
  final double? height;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: SizedBox(
        height: (height ?? 140).h,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // ── Watermark G — sits centre-right inside the red area ──────────
            Positioned(
              left: 225.w,
              top: 60.h,
              child: Transform.rotate(
                angle: -1.92 * 3.141592653589793 / 180,
                child: Image.asset(
                  'assets/icons/welcome_watermark_G.png',
                  width: 160.w,
                  height: 220.w,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            // ── Watermark ring — right side ───────────────────────────────────
            Positioned(
              right: -0.002.w,
              top: -0.1.h,
              child: Image.asset(
                'assets/icons/welcome_watermark.png',
                width: 260.w,
                height: 270.h,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
