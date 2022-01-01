import 'package:ivfoods_mobile_app/features/restaurant_features/get_restaurant/domain/entities/get_restaurant.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_restaurant/data/models/restaurant_model.dart';

class GetRestaurantModel extends GetRestaurant{
  GetRestaurantModel({
    required bool? success,
    required String? msg,
    required RestaurantModel? restaurant,
  }) : super(
    success: success,
    msg: msg,
    restaurant: restaurant,
  );

  factory GetRestaurantModel.fromJson(Map<String, dynamic> json) => GetRestaurantModel(
    success: json["success"] == null ? null : json["success"],
    msg: json["msg"] == null ? null : json["msg"],
    restaurant: json["restaurant"] == null ? null : RestaurantModel.fromJson(json["restaurant"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "msg": msg == null ? null : msg,
    "restaurant": restaurant == null ? null : restaurant!.toJson(),
  };

  @override
  List<Object?> get props => [success, msg, restaurant];
}