import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mealgro_rider_app/app/theme/app_colors.dart';
import 'package:mealgro_rider_app/app/theme/app_dimensions.dart';
import 'package:mealgro_rider_app/core/constants/app_icons.dart';
import 'package:mealgro_rider_app/features/profile/features/account_settings/presentation/widgets/account_settings_app_bar.dart';
import 'package:mealgro_rider_app/features/profile/features/account_settings/presentation/widgets/account_settings_labeled_field.dart';
import 'package:mealgro_rider_app/features/profile/features/account_settings/presentation/widgets/save_changes_button.dart';

class ChangeEmailScreen extends StatefulWidget {
  const ChangeEmailScreen({super.key});

  @override
  State<ChangeEmailScreen> createState() => _ChangeEmailScreenState();
}

class _ChangeEmailScreenState extends State<ChangeEmailScreen> {
  final _currentEmailController = TextEditingController(
    text: 'michealjones24@gmail.com', // TODO: load from profile provider
  );
  final _newEmailController = TextEditingController();

  bool get _isFilled => _newEmailController.text.trim().isNotEmpty;

  @override
  void initState() {
    super.initState();
    _newEmailController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _currentEmailController.dispose();
    _newEmailController.dispose();
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
            const AccountSettingsAppBar(title: 'Change email'),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.screenPaddingH.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AccountSettingsLabeledField(
                      label: 'Current email',
                      iconPath: AppIcons.letter,
                      controller: _currentEmailController,
                      readOnly: true,
                    ),
                    SizedBox(height: 16.h),
                    AccountSettingsLabeledField(
                      label: 'New email',
                      iconPath: AppIcons.letter,
                      controller: _newEmailController,
                      keyboardType: TextInputType.emailAddress,
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
                  // TODO: call account settings provider to update email
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
