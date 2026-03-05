// Auth guard — redirect callback for GoRouter.
//
// Milestone 1: returns null (all routes freely accessible for UI development).
// Milestone 2: read authProvider here and redirect unauthenticated users.
//
// Example M2 usage:
//   final isLoggedIn = ref.read(authProvider).valueOrNull?.isLoggedIn ?? false;
//   if (!isLoggedIn) return RoutePaths.loginEmail;

String? authGuard(String currentPath) {
  // TODO(Milestone 2): implement real auth redirect logic
  return null;
}
