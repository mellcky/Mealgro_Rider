import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mealgro_rider_app/app/router/route_paths.dart';

/// Entry point for Delivery History accessed from the Profile menu.
///
/// Delegates to the shared history tab via [RoutePaths.history].
class ProfileDeliveryHistoryScreen extends StatelessWidget {
  const ProfileDeliveryHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.go(RoutePaths.history);
    });
    return const Scaffold(body: SizedBox.shrink());
  }
}
