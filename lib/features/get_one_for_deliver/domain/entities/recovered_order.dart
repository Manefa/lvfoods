import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/domain/entities/product.dart';

class RecoveredOrder extends Equatable{
  final String? orderGroup;
  final String? code;
  final int? quantity;
  final int? total;
  final Product? product;
  final String? recoverer;
  final Product? item;
  final String? statusPayment;
  final String? status;
  final String? id;
  final String? createdAt;
  final String? updatedAt;

  RecoveredOrder({
    required this.orderGroup,
    required this.code,
    required this.quantity,
    required this.total,
    required this.product,
    required this.recoverer,
    required this.item,
    required this.statusPayment,
    required this.status,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });

  // factory RecoveredOrder.fromJson(Map<String, dynamic> json) => RecoveredOrder(
  //   orderGroup: json["order_group"] == null ? null : msgValues.map[json["order_group"]],
  //   code: json["code"] == null ? null : msgValues.map[json["code"]],
  //   quantity: json["quantity"] == null ? null : json["quantity"],
  //   total: json["total"] == null ? null : json["total"],
  //   product: json["product"] == null ? null : Product.fromJson(json["product"]),
  //   recoverer: json["recoverer"] == null ? null : msgValues.map[json["recoverer"]],
  //   item: json["item"] == null ? null : Product.fromJson(json["item"]),
  //   statusPayment: json["status_payment"] == null ? null : json["status_payment"],
  //   status: json["status"] == null ? null : json["status"],
  //   id: json["_id"] == null ? null : msgValues.map[json["_id"]],
  //   createdAt: json["createdAt"] == null ? null : msgValues.map[json["createdAt"]],
  //   updatedAt: json["updatedAt"] == null ? null : msgValues.map[json["updatedAt"]],
  // );

  Map<String, dynamic> toJson() => {
    "order_group": orderGroup == null ? null : orderGroup,
    "code": code == null ? null : code,
    "quantity": quantity == null ? null : quantity,
    "total": total == null ? null : total,
    "product": product == null ? null : product!.toJson(),
    "recoverer": recoverer == null ? null : recoverer,
    "item": item == null ? null : item!.toJson(),
    "status_payment": statusPayment == null ? null : statusPayment,
    "status": status == null ? null : status,
    "_id": id == null ? null : id,
    "createdAt": createdAt == null ? null : createdAt,
    "updatedAt": updatedAt == null ? null : updatedAt,
  };

  @override
  List<Object?> get props => [];
}