import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mealgro_rider_app/app/theme/app_colors.dart';
import 'package:mealgro_rider_app/app/theme/app_dimensions.dart';
import 'package:mealgro_rider_app/core/constants/app_icons.dart';
import 'package:mealgro_rider_app/features/profile/features/account_settings/presentation/widgets/account_settings_app_bar.dart';
import 'package:mealgro_rider_app/features/profile/features/account_settings/presentation/widgets/account_settings_labeled_field.dart';
import 'package:mealgro_rider_app/features/profile/features/account_settings/presentation/widgets/save_changes_button.dart';

class ChangePhoneScreen extends StatefulWidget {
  const ChangePhoneScreen({super.key});

  @override
  State<ChangePhoneScreen> createState() => _ChangePhoneScreenState();
}

class _ChangePhoneScreenState extends State<ChangePhoneScreen> {
  final _currentPhoneController = TextEditingController(
    text: '+234 809 7654 789', // TODO: load from profile provider
  );
  final _newPhoneController = TextEditingController();

  bool get _isFilled => _newPhoneController.text.trim().isNotEmpty;

  @override
  void initState() {
    super.initState();
    _newPhoneController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _currentPhoneController.dispose();
    _newPhoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AccountSettingsAppBar(title: 'Change Phone number'),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.screenPaddingH.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AccountSettingsLabeledField(
                      label: 'Current number',
                      iconPath: AppIcons.phoneRounded,
                      controller: _currentPhoneController,
                      readOnly: true,
                    ),
                    SizedBox(height: 16.h),
                    AccountSettingsLabeledField(
                      label: 'New number',
                      iconPath: AppIcons.phoneRounded,
                      controller: _newPhoneController,
                      keyboardType: TextInputType.phone,
                      showValidCheck: _isFilled,
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                AppDimensions.screenPaddingH.w,
                0,
                AppDimensions.screenPaddingH.w,
                AppDimensions.space24.h,
              ),
              child: SaveChangesButton(
                isEnabled: _isFilled,
                onPressed: () {
                  // TODO: call account settings provider to update phone
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
