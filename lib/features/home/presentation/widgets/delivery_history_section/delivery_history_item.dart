import 'package:mealgro_rider_app/shared/widgets/delivery_history_tile.dart';

/// Data model for a single delivery history row used on the home-screen preview.
class DeliveryHistoryItem {
  const DeliveryHistoryItem({
    required this.restaurantName,
    required this.subtitle,
    required this.status,
  });

  final String restaurantName;
  final String subtitle;
  final DeliveryStatus status;
}
