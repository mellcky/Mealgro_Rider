import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mealgro_rider_app/app/theme/app_colors.dart';
import 'package:mealgro_rider_app/features/home/presentation/widgets/delivery_history_section/delivery_history_item.dart';
import 'package:mealgro_rider_app/shared/widgets/delivery_history_tile.dart';

/// Populated list widget shown inside the delivery history section when
/// [items] is non-empty.
class DeliveryHistoryList extends StatelessWidget {
  const DeliveryHistoryList({super.key, required this.items});

  final List<DeliveryHistoryItem> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Column(
        children: List.generate(items.length, (i) {
          final item = items[i];
          return Column(
            children: [
              DeliveryHistoryTile(
                restaurantName: item.restaurantName,
                subtitle: item.subtitle,
                status: item.status,
              ),
              if (i < items.length - 1)
                const Divider(
                  height: 1,
                  thickness: 1,
                  color: AppColors.grey200,
                ),
            ],
          );
        }),
      ),
    );
  }
}
