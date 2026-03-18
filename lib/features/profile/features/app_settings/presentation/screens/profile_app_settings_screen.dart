import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mealgro_rider_app/app/router/route_paths.dart';

/// Entry point for App Settings accessed from the Profile menu.
///
/// Pushes to the shared app settings screen via [RoutePaths.appSettings].
class ProfileAppSettingsScreen extends StatelessWidget {
  const ProfileAppSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.push(RoutePaths.appSettings);
    });
    return const Scaffold(body: SizedBox.shrink());
  }
}
