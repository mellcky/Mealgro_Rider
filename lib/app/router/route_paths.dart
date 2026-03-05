// All named route path constants.
// Never hardcode path strings in GoRoute builders or context.go() calls — use these.
abstract final class RoutePaths {
  // ── Onboarding ────────────────────────────────────────────────────────────
  static const String splash = '/';
  static const String onboarding = '/onboarding';

  // ── Auth ──────────────────────────────────────────────────────────────────
  static const String register = '/register';
  static const String verifyEmail = '/verify-email';
  static const String setupPassword = '/setup-password';
  static const String authSuccess = '/auth-success';
  static const String loginEmail = '/login-email';
  static const String loginRiderId = '/login-rider-id';

  // ── Bottom Nav Shell (5 persistent tabs) ─────────────────────────────────
  static const String home = '/home';
  static const String requests = '/requests';
  static const String history = '/history';
  static const String earnings = '/earnings';
  static const String profile = '/profile';

  // ── Delivery (full-screen, no bottom nav) ─────────────────────────────────
  static const String activeDelivery = '/active-delivery';
  static const String deliverySuccess = '/delivery-success';
  static const String deliveryDetail = '/delivery-detail';

  // ── Earnings sub-routes ───────────────────────────────────────────────────
  static const String earningsStatus = '/earnings-status';
  static const String withdrawals = '/withdrawals';
  static const String withdrawalConfirm = '/withdrawal-confirm';
  static const String withdrawalStatus = '/withdrawal-status';

  // ── Bank Account ──────────────────────────────────────────────────────────
  static const String bankAccount = '/bank-account';
  static const String addBank = '/add-bank';
  static const String findBank = '/find-bank';

  // ── Profile sub-routes ────────────────────────────────────────────────────
  static const String profileSettings = '/profile-settings';
  static const String changePicture = '/change-picture';
  static const String changeEmail = '/change-email';
  static const String changePhone = '/change-phone';

  // ── App Settings ──────────────────────────────────────────────────────────
  static const String appSettings = '/app-settings';
}
