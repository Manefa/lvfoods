
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/data/models/order_model.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/data/models/user_model.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/domain/entities/order_group.dart';

class OrderGroupModel extends OrderGroup{

  OrderGroupModel({
    required final UserModel? user,
    required final String? code,
    required final List<OrderModel>? orders,
    required final String? delivery,
    required final int? totalPrice,
    required final String? statusPayment,
    required final String? status,
    required final String? id,
    required final String? createdAt,
    required final String? updatedAt,
  }) : super(
    user: user,
    code: code,
    orders: orders,
    delivery: delivery,
    totalPrice: totalPrice,
    statusPayment: statusPayment,
    status: status,
    id: id,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );

  factory OrderGroupModel.fromJson(Map<String, dynamic> json) => OrderGroupModel(
    user: json["user"] == null ? null : UserModel.fromJson(json["user"]),
    code: json["code"] == null ? null : json["code"],
    orders: json["orders"] == null ? null : List<OrderModel>.from(json["orders"].map((x) => OrderModel.fromJson(x))),
    delivery: json["delivery"] == null ? null : json["delivery"],
    totalPrice: json["total_price"] == null ? null : json["total_price"],
    statusPayment: json["status_payment"] == null ? null : json["status_payment"],
    status: json["status"] == null ? null : json["status"],
    id: json["_id"] == null ? null : json["_id"],
    createdAt: json["createdAt"] == null ? null : json["createdAt"],
    updatedAt: json["updatedAt"] == null ? null : json["updatedAt"],
  );

  Map<String, dynamic> toJson() => {
    "user": user == null ? null : user!.toJson(),
    "code": code == null ? null : code,
    "orders": orders == null ? null : List<dynamic>.from(orders!.map((x) => x)),
    "delivery": delivery == null ? null : delivery,
    "total_price": totalPrice == null ? null : totalPrice,
    "status_payment": statusPayment == null ? null : statusPayment,
    "status": status == null ? null : status,
    "_id": id == null ? null : id,
    "createdAt": createdAt == null ? null : createdAt,
    "updatedAt": updatedAt == null ? null : updatedAt,
  };
}