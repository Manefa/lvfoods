import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/deliveries/domain/entities/order.dart';

class OrderGroup extends Equatable{
  final List<Order>? orders;
  final String? statusPayment;

  OrderGroup({
     required this.orders,
    required this.statusPayment,
  });


  // factory OrderGroup.fromJson(Map<String, dynamic> json) => OrderGroup(
  //   orders: json["orders"] == null ? null : List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
  // );

  Map<String, dynamic> toJson() => {
    "orders": orders == null ? null : List<dynamic>.from(orders!.map((x) => x.toJson())),
  };

  @override
  List<Object?> get props => [orders];
}