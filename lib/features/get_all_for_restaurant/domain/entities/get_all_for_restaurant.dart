import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/domain/entities/order.dart';
import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/domain/entities/restaurant.dart';

class GetAllForRestaurant extends Equatable{
  final bool? success;
  final List<Order>? orders;
  final Restaurant? restaurant;

  GetAllForRestaurant({
    required final this.success,
    required final this.orders,
    required final this.restaurant,
  });

  Map<String, dynamic> toJson() => {
    "success": success,
    "orders": List<dynamic>.from(orders!.map((x) => x.toJson())),
    "restaurant": restaurant!.toJson(),
  };

  @override
  List<Object?> get props => [success, orders, restaurant];
}