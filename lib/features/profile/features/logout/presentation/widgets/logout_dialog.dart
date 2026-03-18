import 'package:flutter/material.dart';
import 'package:mealgro_rider_app/app/theme/app_colors.dart';

/// Reusable logout confirmation dialog.
///
/// Call [LogoutDialog.show] from any widget that needs a log-out confirmation.
/// The [onConfirm] callback is invoked when the user taps "Log out"; wire it
/// to the logoutProvider action once the provider is implemented.
class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key, required this.onConfirm});

  final VoidCallback onConfirm;

  /// Convenience helper — shows the dialog and returns a [Future] that
  /// resolves to `true` when the user confirms, `false` on cancel.
  static Future<bool> show(BuildContext context,
      {required VoidCallback onConfirm}) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => LogoutDialog(onConfirm: onConfirm),
    );
    return confirmed ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Log out'),
      content: const Text('Are you sure you want to log out?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true);
            onConfirm();
          },
          style: TextButton.styleFrom(foregroundColor: AppColors.primary),
          child: const Text('Log out'),
        ),
      ],
    );
  }
}
