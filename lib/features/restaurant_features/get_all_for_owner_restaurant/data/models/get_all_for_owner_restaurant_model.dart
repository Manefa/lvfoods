import 'package:ivfoods_mobile_app/features/restaurant_features/get_all_for_owner_restaurant/data/models/order_model.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_all_for_owner_restaurant/domain/entities/get_all_for_owner_restaurant.dart';

class GetAllForOwnerRestaurantModel extends GetAllForOwnerRestaurant{

  GetAllForOwnerRestaurantModel({
    required bool? success,
    required List<OrderModel>? orders,
  }) : super(
    success: success,
    orders: orders,
  );

  factory GetAllForOwnerRestaurantModel.fromJson(Map<String, dynamic> json) => GetAllForOwnerRestaurantModel(
    success: json["success"] == null ? null : json["success"],
    orders: json["orders"] == null ? null : List<OrderModel>.from(json["orders"].map((x) => OrderModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "orders": orders == null ? null : List<dynamic>.from(orders!.map((x) => x.toJson())),
  };

  @override
  List<Object?> get props => [success, orders];
}