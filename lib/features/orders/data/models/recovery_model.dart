import 'package:ivfoods_mobile_app/features/orders/data/models/restaurant_model.dart';
import 'package:ivfoods_mobile_app/features/orders/domain/entities/recovery.dart';

class RecoveryModel extends Recovery{
  RecoveryModel({
    required final RestaurantModel? restaurant,
    required final int? quantity,
  }) : super(
    restaurant: restaurant,
    quantity: quantity,
  );

  factory RecoveryModel.fromJson(Map<String, dynamic> json) => RecoveryModel(
    restaurant: RestaurantModel.fromJson(json["restaurant"]),
    quantity: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "restaurant": restaurant!.toJson(),
    "quantity": quantity,
  };
}