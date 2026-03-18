import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mealgro_rider_app/app/router/route_paths.dart';
import 'package:mealgro_rider_app/app/theme/app_colors.dart';
import 'package:mealgro_rider_app/core/constants/app_icons.dart';
import 'package:mealgro_rider_app/features/profile/features/account_settings/presentation/widgets/account_settings_app_bar.dart';
import 'package:mealgro_rider_app/features/profile/presentation/widgets/profile_menu_item.dart';

class ProfileSettingsScreen extends StatelessWidget {
  const ProfileSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AccountSettingsAppBar(title: 'Profile Settings'),
            ProfileMenuItem(
              label: 'Change profile picture',
              iconPath: AppIcons.userCheck,
              onTap: () => context.push(RoutePaths.changePicture),
            ),
            ProfileMenuItem(
              label: 'Change email',
              iconPath: AppIcons.letter,
              onTap: () => context.push(RoutePaths.changeEmail),
            ),
            ProfileMenuItem(
              label: 'Change phone number',
              iconPath: AppIcons.phoneRounded,
              onTap: () => context.push(RoutePaths.changePhone),
            ),
            ProfileMenuItem(
              label: 'Delete your account',
              iconPath: AppIcons.trashBinTrash,
              onTap: () {
                // TODO: implement delete account confirmation flow
              },
            ),
          ],
        ),
      ),
    );
  }
}
