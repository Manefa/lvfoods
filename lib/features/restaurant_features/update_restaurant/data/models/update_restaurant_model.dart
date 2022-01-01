import 'package:ivfoods_mobile_app/features/restaurant_features/update_restaurant/domain/entities/update_restaurant.dart';

class UpdateRestaurantModel extends UpdateRestaurant{

  UpdateRestaurantModel({
    required bool? success,
    required String? msg,
  }) : super(
    success: success,
    msg: msg,
  );

  factory UpdateRestaurantModel.fromJson(Map<String, dynamic> json) => UpdateRestaurantModel(
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