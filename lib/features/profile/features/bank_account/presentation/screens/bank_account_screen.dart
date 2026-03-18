import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mealgro_rider_app/app/router/route_paths.dart';
import 'package:mealgro_rider_app/app/theme/app_colors.dart';
import 'package:mealgro_rider_app/app/theme/app_dimensions.dart';
import 'package:mealgro_rider_app/app/theme/app_text_styles.dart';
import 'package:mealgro_rider_app/core/constants/app_icons.dart';
import 'package:mealgro_rider_app/features/profile/features/account_settings/presentation/widgets/account_settings_app_bar.dart';
import 'package:mealgro_rider_app/features/profile/features/account_settings/presentation/widgets/save_changes_button.dart';
import 'package:mealgro_rider_app/features/profile/features/bank_account/presentation/providers/profile_bank_account_provider.dart';

class BankAccountScreen extends ConsumerWidget {
  const BankAccountScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profileBankAccountProvider);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            const AccountSettingsAppBar(
              title: 'Bank account',
              fallbackRoute: RoutePaths.profile,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.screenPaddingH.w,
                ),
                child: state.hasAccount
                    ? _BankAccountDetails(account: state.account!)
                    : const _EmptyBankAccountState(),
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
                label: state.hasAccount ? 'Edit account' : 'Add new account',
                isEnabled: true,
                onPressed: () => context.push(RoutePaths.addBank),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyBankAccountState extends StatelessWidget {
  const _EmptyBankAccountState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 132.r,
            height: 132.r,
            decoration: const BoxDecoration(
              color: Color(0xFFFFEFEE),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Container(
              width: 86.r,
              height: 86.r,
              decoration: const BoxDecoration(
                color: Color(0xFFFCE2DE),
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: SvgPicture.asset(
                AppIcons.wallet,
                width: 38.r,
                height: 38.r,
                colorFilter: const ColorFilter.mode(
                  AppColors.grey500,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          SizedBox(height: 28.h),
          Text(
            "You don't have a bank\naccount added yet",
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyL.copyWith(
              color: const Color(0xFF7D8EA8),
              fontWeight: FontWeight.w500,
              height: 1.45,
            ),
          ),
        ],
      ),
    );
  }
}

class _BankAccountDetails extends StatelessWidget {
  const _BankAccountDetails({required this.account});

  final ProfileBankAccount account;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _DetailField(label: 'Account number', value: account.accountNumber),
        SizedBox(height: AppDimensions.space16.h),
        _DetailField(label: 'Account name', value: account.accountName),
        SizedBox(height: AppDimensions.space16.h),
        _DetailField(label: 'Bank name', value: account.bankName),
      ],
    );
  }
}

class _DetailField extends StatelessWidget {
  const _DetailField({required this.label, required this.value});

  final String label;
  final String value;

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
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          decoration: BoxDecoration(
            color: AppColors.grey200,
            borderRadius: BorderRadius.circular(AppDimensions.radiusM.r),
          ),
          child: Text(
            value,
            style: AppTextStyles.headingS.copyWith(
              color: AppColors.grey650,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
