import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mealgro_rider_app/app/router/route_paths.dart';
import 'package:mealgro_rider_app/app/theme/app_colors.dart';
import 'package:mealgro_rider_app/app/theme/app_dimensions.dart';
import 'package:mealgro_rider_app/app/theme/app_text_styles.dart';
import 'package:mealgro_rider_app/features/profile/features/account_settings/presentation/widgets/account_settings_app_bar.dart';

class FindBankScreen extends StatefulWidget {
  const FindBankScreen({super.key});

  @override
  State<FindBankScreen> createState() => _FindBankScreenState();
}

class _FindBankScreenState extends State<FindBankScreen> {
  static const List<String> _banks = [
    'Access Bank',
    'GTBank',
    'First Bank',
    'UBA',
    'Zenith Bank',
    'Fidelity Bank',
    'Union Bank',
    'Wema Bank',
    'Kuda Microfinance Bank',
    'Moniepoint MFB',
  ];

  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final query = _searchController.text.trim().toLowerCase();
    final filteredBanks = _banks
        .where((bank) => bank.toLowerCase().contains(query))
        .toList(growable: false);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            const AccountSettingsAppBar(
              title: 'Find bank',
              fallbackRoute: RoutePaths.addBank,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.screenPaddingH.w,
              ),
              child: Container(
                height: 50.h,
                decoration: BoxDecoration(
                  color: AppColors.grey100,
                  borderRadius: BorderRadius.circular(AppDimensions.radiusM.r),
                  border: Border.all(color: AppColors.grey300),
                ),
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      size: 20.r,
                      color: AppColors.grey600,
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        style: AppTextStyles.bodyM,
                        decoration: InputDecoration(
                          hintText: 'Search bank',
                          hintStyle: AppTextStyles.bodyM.copyWith(
                            color: AppColors.grey600,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.screenPaddingH.w,
                ),
                child: filteredBanks.isEmpty
                    ? Center(
                        child: Text(
                          'No bank found',
                          style: AppTextStyles.bodyM.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      )
                    : ListView.separated(
                        itemCount: filteredBanks.length,
                        separatorBuilder: (_, __) => Divider(
                          height: 1,
                          color: AppColors.grey200,
                        ),
                        itemBuilder: (context, index) {
                          final bank = filteredBanks[index];
                          return ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(
                              bank,
                              style: AppTextStyles.bodyL.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            trailing: Icon(
                              Icons.chevron_right,
                              color: AppColors.grey600,
                              size: 20.r,
                            ),
                            onTap: () => context.pop(bank),
                          );
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
