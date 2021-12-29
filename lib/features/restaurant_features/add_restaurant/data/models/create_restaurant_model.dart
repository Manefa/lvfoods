import 'package:ivfoods_mobile_app/features/restaurant_features/add_restaurant/domain/entities/create_restaurant.dart';

class CreateRestaurantModel extends CreateRestaurant{

  CreateRestaurantModel({
    required bool? success,
    required String? msg,
  }) : super(
    success: success,
    msg: msg,
  );

  factory CreateRestaurantModel.fromJson(Map<String, dynamic> json) => CreateRestaurantModel(
    success: json["success"] == null ? null : json["success"],
    msg: json["msg"] == null ? null : json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "msg": msg == null ? null : msg,
  };

  @override
  List<Object?> get props => [success, msg];
}