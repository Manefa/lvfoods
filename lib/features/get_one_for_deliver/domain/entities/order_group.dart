import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/domain/entities/order.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/domain/entities/user.dart';

class OrderGroup extends Equatable{
  final User? user;
  final String? code;
  final List<Order>? orders;
  final String? delivery;
  final int? totalPrice;
  final String? statusPayment;
  final String? status;
  final String? id;
  final String? createdAt;
  final String? updatedAt;

  OrderGroup({
    required this.user,
    required this.code,
    required this.orders,
    required this.delivery,
    required this.totalPrice,
    required this.statusPayment,
    required this.status,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });

  // factory OrderGroup.fromJson(Map<String, dynamic> json) => OrderGroup(
  //   user: json["user"] == null ? null : Deliver.fromJson(json["user"]),
  //   code: json["code"] == null ? null : msgValues.map[json["code"]],
  //   orders: json["orders"] == null ? null : List<Msg>.from(json["orders"].map((x) => msgValues.map[x])),
  //   delivery: json["delivery"] == null ? null : msgValues.map[json["delivery"]],
  //   totalPrice: json["total_price"] == null ? null : json["total_price"],
  //   statusPayment: json["status_payment"] == null ? null : json["status_payment"],
  //   status: json["status"] == null ? null : json["status"],
  //   id: json["_id"] == null ? null : msgValues.map[json["_id"]],
  //   createdAt: json["createdAt"] == null ? null : msgValues.map[json["createdAt"]],
  //   updatedAt: json["updatedAt"] == null ? null : msgValues.map[json["updatedAt"]],
  // );

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

  @override
  List<Object?> get props => [user, code, orders, delivery, totalPrice, totalPrice, statusPayment, status,
  statusPayment, id, createdAt, updatedAt];
}