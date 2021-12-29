
import 'package:ivfoods_mobile_app/features/restaurant_features/get_one_restaurant_and_populate_products/data/models/restaurant_model.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_one_restaurant_and_populate_products/domain/entities/get_one_restaurant_and_populate_products.dart';

class GetOneRestaurantAndPopulateProductsModel extends GetOneRestaurantAndPopulateProducts{
  GetOneRestaurantAndPopulateProductsModel({
    required bool? success,
    required String? msg,
    required RestaurantModel? restaurant,
  }) : super(
    success: success,
    msg: msg,
    restaurant: restaurant,
  );

  factory GetOneRestaurantAndPopulateProductsModel.fromJson(Map<String, dynamic> json) => GetOneRestaurantAndPopulateProductsModel(
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