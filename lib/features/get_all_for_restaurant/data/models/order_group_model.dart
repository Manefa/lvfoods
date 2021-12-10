import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/data/models/delivery_model.dart';
import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/data/models/user_model.dart';
import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/domain/entities/order_group.dart';

class OrderGroupModel extends OrderGroup{
  OrderGroupModel({
    required final UserModel? user,
    required final String? code,
    required final String? orders,
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
    user: UserModel.fromJson(json["user"]),
    code: json["code"],
    orders: json["orders"],
    delivery: DeliveryModel.fromJson(json["delivery"]),
    totalPrice: json["total_price"],
    statusPayment: json["status_payment"],
    status: json["status"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "user": user!.toJson(),
    "code": code,
    "orders": orders,
    "delivery": delivery!.toJson(),
    "total_price": totalPrice,
    "status_payment": statusPayment,
    "status": status,
    "_id": id,
  };
}