import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mealgro_rider_app/app/router/route_paths.dart';

/// Entry point for the Earnings section accessed from the Profile menu.
///
/// Delegates to the shared earnings tab via [RoutePaths.earnings].
/// Keeping this screen inside profile/features/earnings allows the profile
/// feature to own its navigation contract independently of the tab bar.
class ProfileEarningsScreen extends StatelessWidget {
  const ProfileEarningsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Redirect to earnings tab — the full earnings UI lives there.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.go(RoutePaths.earnings);
    });
    return const Scaffold(body: SizedBox.shrink());
  }
}
