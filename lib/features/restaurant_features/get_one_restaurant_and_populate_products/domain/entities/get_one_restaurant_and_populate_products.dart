import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_one_restaurant_and_populate_products/domain/entities/restaurant.dart';

class GetOneRestaurantAndPopulateProducts extends Equatable{
  final bool? success;
  final String? msg;
  final Restaurant? restaurant;

  GetOneRestaurantAndPopulateProducts({
    required this.success,
    required this.msg,
    required this.restaurant,
  });

  // factory GetOneRestaurantAndPopulateProducts.fromJson(Map<String, dynamic> json) => GetOneRestaurantAndPopulateProducts(
  //   success: json["success"] == null ? null : json["success"],
  //   msg: json["msg"] == null ? null : msgValues.map[json["msg"]],
  //   restaurant: json["restaurant"] == null ? null : Restaurant.fromJson(json["restaurant"]),
  // );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "msg": msg == null ? null : msg,
    "restaurant": restaurant == null ? null : restaurant!.toJson(),
  };

  @override
  List<Object?> get props => [success, msg, restaurant];
}