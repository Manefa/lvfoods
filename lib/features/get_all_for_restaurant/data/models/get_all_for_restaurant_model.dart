import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/data/models/order_model.dart';
import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/data/models/restaurant_model.dart';
import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/domain/entities/get_all_for_restaurant.dart';

class GetAllForRestaurantModel extends GetAllForRestaurant{
  GetAllForRestaurantModel({
    required final bool? success,
    required final List<OrderModel>? orders,
    required final RestaurantModel? restaurant,
  }) : super(
    success: success,
    orders: orders,
    restaurant: restaurant,
  );

  factory GetAllForRestaurantModel.fromJson(Map<String, dynamic> json) => GetAllForRestaurantModel(
    success: json["success"],
    orders: List<OrderModel>.from(json["orders"].map((x) => OrderModel.fromJson(x))),
    restaurant: RestaurantModel.fromJson(json["restaurant"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "orders": List<dynamic>.from(orders!.map((x) => x.toJson())),
    "restaurant": restaurant!.toJson(),
  };
}