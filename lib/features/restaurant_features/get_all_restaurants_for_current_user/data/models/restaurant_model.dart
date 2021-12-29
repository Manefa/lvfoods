
import 'package:ivfoods_mobile_app/features/restaurant_features/get_all_restaurants_for_current_user/domain/entities/restaurant.dart';

class RestaurantModel extends Restaurant{

  RestaurantModel({
    required final String? name,
    required final String? profilePicture,
    required final String? status,
  }) : super(
    name: name,
    profilePicture: profilePicture,
    status: status,
  );

  factory RestaurantModel.fromJson(Map<String, dynamic> json) => RestaurantModel(
    name: json["name"] == null ? null : json["name"],
    profilePicture: json["profile_picture"] == null ? null : json["profile_picture"],
    status: json["status"] == null ? null : json["status"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "profile_picture": profilePicture == null ? null : profilePicture,
    "status": status == null ? null : status,
  };

  @override
  List<Object?> get props => [name, profilePicture, status];
}