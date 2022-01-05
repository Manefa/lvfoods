import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_all_for_owner_restaurant/domain/entities/order.dart';


class GetAllForOwnerRestaurant extends Equatable{
  final bool? success;
  final List<Order>? orders;

  GetAllForOwnerRestaurant({
    required this.success,
    required this.orders,
  });

  // factory GetAllForOwnerRestaurant.fromJson(Map<String, dynamic> json) => GetAllForOwnerRestaurant(
  //   success: json["success"] == null ? null : json["success"],
  //   orders: json["orders"] == null ? null : List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
  // );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "orders": orders == null ? null : List<dynamic>.from(orders!.map((x) => x.toJson())),
  };

  @override
  List<Object?> get props => [success, orders];
}