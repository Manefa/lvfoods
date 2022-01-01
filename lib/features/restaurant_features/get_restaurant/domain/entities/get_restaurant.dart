import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_restaurant/domain/entities/restaurant.dart';

class GetRestaurant extends Equatable{
  final bool? success;
  final String? msg;
  final Restaurant? restaurant;

  GetRestaurant({
    required this.success,
    required this.msg,
    required this.restaurant,
  });

  // factory GetRestaurant.fromJson(Map<String, dynamic> json) => GetRestaurant(
  //   success: json["success"] == null ? null : json["success"],
  //   msg: json["msg"] == null ? null : json["msg"],
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