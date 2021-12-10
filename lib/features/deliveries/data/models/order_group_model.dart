import 'package:ivfoods_mobile_app/features/deliveries/data/models/order_model.dart';
import 'package:ivfoods_mobile_app/features/deliveries/domain/entities/order_group.dart';

class OrderGroupModel extends OrderGroup{
  final List<OrderModel>? orders;
  final String? statusPayment;

  OrderGroupModel({
    required this.orders,
    required this.statusPayment,
  }) : super(
    orders: orders,
    statusPayment: statusPayment,
  );

  factory OrderGroupModel.fromJson(Map<String, dynamic> json) => OrderGroupModel(
    orders: json["orders"] == null ? null : List<OrderModel>.from(json["orders"].map((x) => OrderModel.fromJson(x))),
    statusPayment: json["status_payment"] == null ? null : json["status_payment"],
  );

  Map<String, dynamic> toJson() => {
    "orders": orders == null ? null : List<dynamic>.from(orders!.map((x) => x.toJson())),
  };
}