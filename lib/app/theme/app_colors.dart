import 'package:flutter/material.dart';

// Brand and semantic color tokens.
// Never use raw Color() values outside this file.
abstract final class AppColors {
  static const Color primary = Color(0xFFFF2509);
  static const Color primaryLight = Color(0xFFFF5C44);
  static const Color primaryDark = Color(0xFFCC1D07);
  static const Color primaryDeep = Color(0xFFAD1400); // Get Started button
  static const Color primarySurface = Color(0xFFFFF0EE);

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color boxShadow =
      Color(0x40000000); // #00000040 = black at 25% opacity
  static const Color grey100 = Color(0xFFF7F7F7);
  static const Color grey200 = Color(0xFFEEEEEE);
  static const Color grey300 = Color(0xFFE0E0E0);
  static const Color grey400 = Color(0xFFBDBDBD);
  static const Color grey500 = Color(0xFF9E9E9E);
  static const Color grey600 = Color(0xFF757575);
  static const Color grey650 = Color(0xFF5F5F5F);
  static const Color grey700 = Color(0xFF424242);
  static const Color grey900 = Color(0xFF1A1A1A);

  // Delivery status
  static const Color statusNew = Color(0xFF4CAF50);
  static const Color statusNewSurface = Color(0xFFE8F5E9);
  static const Color statusPending = Color(0xFFFFC107);
  static const Color statusPendingSurface = Color(0xFFFFF8E1);
  static const Color statusCancelled = Color(0xFFF44336);
  static const Color statusCancelledSurface = Color(0xFFFFEBEE);
  static const Color statusDelivered = Color(0xFF2196F3);
  static const Color statusDeliveredSurface = Color(0xFFE3F2FD);

  // Semantic
  static const Color successGreen = Color(0xFF4CAF50);
  static const Color warningAmber = Color(0xFFFFC107);
  static const Color errorRed = Color(0xFFF44336);

  // Backgrounds
  static const Color scaffoldBg = Color(0xFFF9F9F9);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color divider = Color(0xFFE8DDDD);

  // Text
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textGray = Color(0xFF5F5F5F);
  static const Color textOnPrimary = Color(0xFFFFFFFF);
  static const Color deliveyHistoryText = Color(0xFFAD1400);

  // Input
  static const Color inputBorder = Color(0xFFE0E0E0);
  static const Color inputFocusBorder = Color(0xFFFF2509);
  static const Color inputFill = Color(0xFFF7F7F7);

  // OTP
  static const Color otpSuccessBorder = Color(0xFF8EFF86);
  static const Color otpSuccessFill = Color(0xFFFAF7F7);
  static const Color inputOtpFilled = Color(0xFFFFDFDB);

  // buttons
  static const Color deliveyHistoryButtonBg = Color(0xFFFFE0DA);
  static const Color openMapButtonBg = Color(0xFFE9E4E4);
}
