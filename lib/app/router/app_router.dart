import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mealgro_rider_app/app/router/auth_guard.dart';
import 'package:mealgro_rider_app/app/router/main_shell.dart';
import 'package:mealgro_rider_app/app/router/route_paths.dart';

// Auth screens
import 'package:mealgro_rider_app/features/auth/presentation/screens/splash_screen.dart';
import 'package:mealgro_rider_app/features/auth/presentation/screens/onboarding_screen.dart';
import 'package:mealgro_rider_app/features/auth/presentation/screens/register_screen.dart';
import 'package:mealgro_rider_app/features/auth/presentation/screens/verify_email_screen.dart';
import 'package:mealgro_rider_app/features/auth/presentation/screens/setup_password_screen.dart';
import 'package:mealgro_rider_app/features/auth/presentation/screens/where_are_you_from_screen.dart';
import 'package:mealgro_rider_app/features/auth/presentation/screens/success_screen.dart';
import 'package:mealgro_rider_app/features/auth/presentation/screens/login_email_screen.dart';
import 'package:mealgro_rider_app/features/auth/presentation/screens/login_rider_id_screen.dart';

// Bottom nav tab screens
import 'package:mealgro_rider_app/features/home/presentation/screens/home_screen.dart';
import 'package:mealgro_rider_app/features/requests/presentation/screens/requests_screen.dart';
import 'package:mealgro_rider_app/features/earnings/presentation/screens/earnings_screen.dart';
import 'package:mealgro_rider_app/features/profile/presentation/screens/profile_screen.dart';
import 'package:mealgro_rider_app/features/orders/presentation/screens/orders_screen.dart';

// Delivery screens
import 'package:mealgro_rider_app/features/orders/presentation/screens/active_delivery_screen.dart';
import 'package:mealgro_rider_app/features/orders/presentation/screens/delivery_success_screen.dart';
import 'package:mealgro_rider_app/features/profile/features/delivery_history/presentation/screens/delivery_detail_screen.dart';

// Earnings / withdrawal screens
import 'package:mealgro_rider_app/features/earnings/presentation/screens/earnings_status_screen.dart';
import 'package:mealgro_rider_app/features/profile/features/withdrawals/presentation/screens/withdrawals_screen.dart';
import 'package:mealgro_rider_app/features/profile/features/withdrawals/presentation/screens/withdrawal_confirm_screen.dart';
import 'package:mealgro_rider_app/features/profile/features/withdrawals/presentation/screens/withdrawal_status_screen.dart';

// Bank account screens
import 'package:mealgro_rider_app/features/profile/features/bank_account/presentation/screens/bank_account_screen.dart';
import 'package:mealgro_rider_app/features/profile/features/bank_account/presentation/screens/add_bank_screen.dart';
import 'package:mealgro_rider_app/features/profile/features/bank_account/presentation/screens/find_bank_screen.dart';

// Profile / settings screens
import 'package:mealgro_rider_app/features/profile/features/account_settings/presentation/screens/profile_settings_screen.dart';
import 'package:mealgro_rider_app/features/profile/features/account_settings/presentation/screens/change_picture_screen.dart';
import 'package:mealgro_rider_app/features/profile/features/account_settings/presentation/screens/change_email_screen.dart';
import 'package:mealgro_rider_app/features/profile/features/account_settings/presentation/screens/change_phone_screen.dart';
import 'package:mealgro_rider_app/features/profile/features/app_settings/presentation/screens/app_settings_screen.dart';

// GoRouter instance — consumed by MaterialApp.router in app.dart
final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: RoutePaths.splash,
    redirect: (context, state) => authGuard(state.matchedLocation),
    routes: [
      // ── Splash & Onboarding ─────────────────────────────────────────────
      GoRoute(path: RoutePaths.splash, builder: (c, s) => const SplashScreen()),
      GoRoute(
        path: RoutePaths.onboarding,
        builder: (c, s) => const OnboardingScreen(),
      ),

      // ── Auth ────────────────────────────────────────────────────────────
      GoRoute(
        path: RoutePaths.register,
        builder: (c, s) => const RegisterScreen(),
      ),
      GoRoute(
        path: RoutePaths.verifyEmail,
        builder: (c, s) => const VerifyEmailScreen(),
      ),
      GoRoute(
        path: RoutePaths.setupPassword,
        builder: (c, s) => const SetupPasswordScreen(),
      ),
      GoRoute(
        path: RoutePaths.whereAreYouFrom,
        builder: (c, s) => const WhereAreYouFromScreen(),
      ),
      GoRoute(
        path: RoutePaths.authSuccess,
        builder: (c, s) => const SuccessScreen(),
      ),
      GoRoute(
        path: RoutePaths.loginEmail,
        builder: (c, s) => const LoginEmailScreen(),
      ),
      GoRoute(
        path: RoutePaths.loginRiderId,
        builder: (c, s) => const LoginRiderIdScreen(),
      ),

      // ── Delivery (full-screen, overlay over nav) ─────────────────────────
      GoRoute(
        path: RoutePaths.activeDelivery,
        builder: (c, s) => const ActiveDeliveryScreen(),
      ),
      GoRoute(
        path: RoutePaths.deliverySuccess,
        builder: (c, s) => const DeliverySuccessScreen(),
      ),
      GoRoute(
        path: RoutePaths.deliveryDetail,
        builder: (c, s) => const DeliveryDetailScreen(),
      ),

      // ── Earnings / Withdrawals / Bank (push from tabs) ────────────────────
      GoRoute(
        path: RoutePaths.earningsStatus,
        builder: (c, s) => const EarningsStatusScreen(),
      ),
      GoRoute(
        path: RoutePaths.withdrawals,
        builder: (c, s) => const WithdrawalsScreen(),
      ),
      GoRoute(
        path: RoutePaths.withdrawalConfirm,
        builder: (c, s) => const WithdrawalConfirmScreen(),
      ),
      GoRoute(
        path: RoutePaths.withdrawalStatus,
        builder: (c, s) => const WithdrawalStatusScreen(),
      ),
      GoRoute(
        path: RoutePaths.bankAccount,
        builder: (c, s) => const BankAccountScreen(),
      ),
      GoRoute(
        path: RoutePaths.addBank,
        builder: (c, s) => const AddBankScreen(),
      ),
      GoRoute(
        path: RoutePaths.findBank,
        builder: (c, s) => const FindBankScreen(),
      ),

      // ── Profile sub-routes (push from Profile tab) ────────────────────────
      GoRoute(
        path: RoutePaths.profileSettings,
        builder: (c, s) => const ProfileSettingsScreen(),
      ),
      GoRoute(
        path: RoutePaths.changePicture,
        builder: (c, s) => const ChangePictureScreen(),
      ),
      GoRoute(
        path: RoutePaths.changeEmail,
        builder: (c, s) => const ChangeEmailScreen(),
      ),
      GoRoute(
        path: RoutePaths.changePhone,
        builder: (c, s) => const ChangePhoneScreen(),
      ),
      GoRoute(
        path: RoutePaths.appSettings,
        builder: (c, s) => const AppSettingsScreen(),
      ),

      // ── Bottom Nav Shell ─────────────────────────────────────────────────
      // Tab order matches Figma design:
      //   0 · Home  |  1 · Earnings  |  2 · orders  |  3 · Requests  |  4 · Profile
      StatefulShellRoute.indexedStack(
        builder: (context, state, shell) => MainShell(navigationShell: shell),
        branches: [
          // 0 · Home
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.home,
                builder: (c, s) => const HomeScreen(),
              ),
            ],
          ),
          // 1 · Earnings
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.earnings,
                builder: (c, s) => const EarningsScreen(),
              ),
            ],
          ),
          // 2 · Orders
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.orders,
                builder: (c, s) => const OrdersScreen(),
              ),
            ],
          ),
          // 3 · Requests
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.requests,
                builder: (c, s) => const RequestsScreen(),
              ),
            ],
          ),
          // 4 · Profile
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.profile,
                builder: (c, s) => const ProfileScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
});
