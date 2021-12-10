import 'package:ivfoods_mobile_app/features/orders/data/models/delivery_model.dart';
import 'package:ivfoods_mobile_app/features/orders/domain/entities/order_group.dart';

class OrderGroupModel extends OrderGroup{
  OrderGroupModel({
    required final String? user,
    required final String? code,
    required final List<String>? orders,
    required final DeliveryModel? delivery,
    required final int? totalPrice,
    required final String? statusPayment,
    required final String? status,
    required final String? id,
  }) : super(
    user: user,
    code: code,
    orders: orders,
    delivery: delivery,
    totalPrice: totalPrice,
    statusPayment: statusPayment,
    status: status,
    id: id,
  );

  factory OrderGroupModel.fromJson(Map<String, dynamic> json) => OrderGroupModel(
    user: json["user"],
    code: json["code"],
    orders: List<String>.from(json["orders"].map((x) => x)),
    delivery: DeliveryModel.fromJson(json["delivery"]),
    totalPrice: json["total_price"],
    statusPayment: json["status_payment"],
    status: json["status"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "user": user,
    "code": code,
    "orders": List<String>.from(orders!.map((x) => x)),
    "delivery": delivery!.toJson(),
    "total_price": totalPrice,
    "status_payment": statusPayment,
    "status": status,
    "_id": id,
  };
}