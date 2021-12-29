import 'package:ivfoods_mobile_app/features/restaurant_features/get_all_restaurants_for_current_user/data/models/restaurant_model.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_all_restaurants_for_current_user/domain/entities/get_all_restaurants_for_current_user.dart';

class GetAllRestaurantsForCurrentUserModel extends GetAllRestaurantsForCurrentUser{

  GetAllRestaurantsForCurrentUserModel({
    required final bool? success,
    required final List<RestaurantModel>? restaurants,
  }) : super(
    success: success,
    restaurants: restaurants,
  );

  factory GetAllRestaurantsForCurrentUserModel.fromJson(Map<String, dynamic> json) => GetAllRestaurantsForCurrentUserModel(
    success: json["success"] == null ? null : json["success"],
    restaurants: json["restaurants"] == null ? null : List<RestaurantModel>.from(json["restaurants"].map((x) => RestaurantModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "restaurants": restaurants == null ? null : List<dynamic>.from(restaurants!.map((x) => x.toJson())),
  };

  @override
  List<Object?> get props => [success, restaurants];
}