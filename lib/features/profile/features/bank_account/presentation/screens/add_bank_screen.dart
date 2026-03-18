import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mealgro_rider_app/app/router/route_paths.dart';
import 'package:mealgro_rider_app/app/theme/app_colors.dart';
import 'package:mealgro_rider_app/app/theme/app_dimensions.dart';
import 'package:mealgro_rider_app/app/theme/app_text_styles.dart';
import 'package:mealgro_rider_app/features/profile/features/account_settings/presentation/widgets/account_settings_app_bar.dart';
import 'package:mealgro_rider_app/features/profile/features/account_settings/presentation/widgets/save_changes_button.dart';
import 'package:mealgro_rider_app/features/profile/features/bank_account/presentation/providers/profile_bank_account_provider.dart';

class AddBankScreen extends ConsumerStatefulWidget {
  const AddBankScreen({super.key});

  @override
  ConsumerState<AddBankScreen> createState() => _AddBankScreenState();
}

class _AddBankScreenState extends ConsumerState<AddBankScreen> {
  final _accountNumberController = TextEditingController();
  final _accountNameController = TextEditingController();

  String? _bankName;

  bool get _canSave {
    return _accountNumberController.text.trim().isNotEmpty &&
        _accountNameController.text.trim().isNotEmpty &&
        _bankName != null;
  }

  @override
  void initState() {
    super.initState();

    final existing = ref.read(profileBankAccountProvider).account;
    if (existing != null) {
      _accountNumberController.text = existing.accountNumber;
      _accountNameController.text = existing.accountName;
      _bankName = existing.bankName;
    }

    _accountNumberController.addListener(_onFieldUpdated);
    _accountNameController.addListener(_onFieldUpdated);
  }

  @override
  void dispose() {
    _accountNumberController
      ..removeListener(_onFieldUpdated)
      ..dispose();
    _accountNameController
      ..removeListener(_onFieldUpdated)
      ..dispose();
    super.dispose();
  }

  void _onFieldUpdated() => setState(() {});

  Future<void> _pickBank() async {
    final bank = await context.push<String>(RoutePaths.findBank);
    if (bank == null || !mounted) return;
    setState(() => _bankName = bank);
  }

  void _saveAccount() {
    if (!_canSave) return;

    ref.read(profileBankAccountProvider.notifier).saveAccount(
          ProfileBankAccount(
            accountNumber: _accountNumberController.text.trim(),
            accountName: _accountNameController.text.trim(),
            bankName: _bankName!,
          ),
        );

    if (context.canPop()) {
      context.pop();
    } else {
      context.go(RoutePaths.bankAccount);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            const AccountSettingsAppBar(
              title: 'Bank account',
              fallbackRoute: RoutePaths.bankAccount,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.screenPaddingH.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _BankTextField(
                      label: 'Account number',
                      controller: _accountNumberController,
                      hintText: '00000000',
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: AppDimensions.space16.h),
                    _BankTextField(
                      label: 'Account name',
                      controller: _accountNameController,
                      hintText: 'John Doe',
                    ),
                    SizedBox(height: AppDimensions.space16.h),
                    _BankPickerField(
                      label: 'Bank name',
                      value: _bankName,
                      onTap: _pickBank,
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
                label: 'Save account',
                isEnabled: _canSave,
                onPressed: _saveAccount,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BankTextField extends StatelessWidget {
  const _BankTextField({
    required this.label,
    required this.controller,
    this.hintText,
    this.keyboardType,
  });

  final String label;
  final TextEditingController controller;
  final String? hintText;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.labelM.copyWith(color: AppColors.textSecondary),
        ),
        SizedBox(height: 8.h),
        Container(
          height: 54.h,
          decoration: BoxDecoration(
            color: AppColors.grey200,
            borderRadius: BorderRadius.circular(AppDimensions.radiusM.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          alignment: Alignment.center,
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            style: AppTextStyles.headingS.copyWith(
              color: AppColors.grey650,
              fontWeight: FontWeight.w700,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: AppTextStyles.headingS.copyWith(
                color: AppColors.grey600,
                fontWeight: FontWeight.w700,
              ),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              isDense: true,
            ),
          ),
        ),
      ],
    );
  }
}

class _BankPickerField extends StatelessWidget {
  const _BankPickerField({
    required this.label,
    required this.value,
    required this.onTap,
  });

  final String label;
  final String? value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final displayValue = value ?? 'Select bank';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.labelM.copyWith(color: AppColors.textSecondary),
        ),
        SizedBox(height: 8.h),
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppDimensions.radiusM.r),
          child: Container(
            height: 54.h,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
              color: AppColors.grey200,
              borderRadius: BorderRadius.circular(AppDimensions.radiusM.r),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    displayValue,
                    style: AppTextStyles.headingS.copyWith(
                      color: value == null ? AppColors.grey600 : AppColors.grey650,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  size: 20.r,
                  color: AppColors.grey600,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
