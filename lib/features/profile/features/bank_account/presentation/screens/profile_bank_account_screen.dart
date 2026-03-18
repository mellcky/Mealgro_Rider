import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mealgro_rider_app/app/router/route_paths.dart';

/// Entry point for Bank Account info accessed from the Profile menu.
///
/// Pushes to the shared bank account screen via [RoutePaths.bankAccount].
class ProfileBankAccountScreen extends StatelessWidget {
  const ProfileBankAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.push(RoutePaths.bankAccount);
    });
    return const Scaffold(body: SizedBox.shrink());
  }
}
