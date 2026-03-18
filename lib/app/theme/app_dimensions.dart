// Spacing, sizing, and radius constants — base-8 grid.
//
// These are raw design-pixel values matching the 390×844 Figma frame.
// When using them inside widgets, apply ScreenUtil extensions to scale:
//
//   SizedBox(width: AppDimensions.space16.w)   ← scales to screen width
//   SizedBox(height: AppDimensions.space24.h)  ← scales to screen height
//   BorderRadius.circular(AppDimensions.radiusM.r) ← scales proportionally
//   SizedBox(height: AppDimensions.buttonHeight.h)
//
// In ThemeData (AppTheme) use raw values — ThemeData runs before ScreenUtil.
abstract final class AppDimensions {
  // ── Spacing ───────────────────────────────────────────────────────────────
  static const double space4 = 4;
  static const double space8 = 8;
  static const double space12 = 12;
  static const double space14 = 14;
  static const double space16 = 16;
  static const double space20 = 20;
  static const double space24 = 24;
  static const double space32 = 32;
  static const double space40 = 40;
  static const double space48 = 48;
  static const double space56 = 56;
  static const double space64 = 64;

  // ── Screen Padding ────────────────────────────────────────────────────────
  static const double screenPaddingH = 24;
  static const double screenPaddingV = 16;
  static const double screenPaddingHLarge = 34;

  // ── Border Radius ─────────────────────────────────────────────────────────
  static const double radiusXS = 4;
  static const double radiusS = 8;
  static const double radiusM = 12;
  static const double radiusL = 15;
  static const double radiusXL = 24;
  static const double radiusXXL = 32;
  static const double radiusCircle = 29.63;
  static const double radiusEarningCard = 29;

  // ── Component Heights ─────────────────────────────────────────────────────
  static const double buttonHeight = 56;
  static const double buttonHeightSm = 44;
  static const double inputHeight = 63.69;
  static const double appBarHeight = 60;
  static const double bottomNavHeight = 64;

  //component widths
  static const double inputWidth = 319.52;

  // ── Avatar Sizes ──────────────────────────────────────────────────────────
  static const double avatarSm = 36;
  static const double avatarM = 48;
  static const double avatarL = 80;
  static const double avatarXL = 120;

  // ── Icons ─────────────────────────────────────────────────────────────────
  static const double iconSm = 16;
  static const double iconM = 24;
  static const double iconL = 32;

  // ── Card ──────────────────────────────────────────────────────────────────
  static const double cardRadius = 16;
  static const double cardElevation = 0;
  static const double cardPadding = 16;
}
