import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/domain/entities/product.dart';

class Order extends Equatable{
  final String? recoverer;
  final int? total;
  final String? status;
  final String? statusPayment;
  final String? id;
  final String? product;
  final String? orderGroup;
  final int? quantity;
  final Product? item;
  final String? createdAt;
  final String? updatedAt;
  final String? code;

  Order({
    required  this.recoverer,
    required  this.total,
    required  this.status,
    required  this.statusPayment,
    required  this.id,
    required  this.product,
    required  this.orderGroup,
    required  this.quantity,
    required  this.item,
    required  this.createdAt,
    required  this.updatedAt,
    required  this.code,
  });

  // factory Order.fromJson(Map<String, dynamic> json) => Order(
  //   recoverer: json["recoverer"] == null ? null : json["recoverer"],
  //   total: json["total"] == null ? null : json["total"],
  //   status: json["status"] == null ? null : json["status"],
  //   statusPayment: json["status_payment"] == null ? null : json["status_payment"],
  //   id: json["_id"] == null ? null : json["_id"],
  //   product: json["product"] == null ? null : json["product"],
  //   orderGroup: json["order_group"] == null ? null : json["order_group"],
  //   quantity: json["quantity"] == null ? null : json["quantity"],
  //   item: json["item"] == null ? null : Item.fromJson(json["item"]),
  //   createdAt: json["createdAt"] == null ? null : json["createdAt"],
  //   updatedAt: json["updatedAt"] == null ? null : json["updatedAt"],
  //   code: json["code"] == null ? null : json["code"],
  // );

  Map<String, dynamic> toJson() => {
    "recoverer": recoverer == null ? null : recoverer,
    "total": total == null ? null : total,
    "status": status == null ? null : status,
    "status_payment": statusPayment == null ? null : statusPayment,
    "_id": id == null ? null : id,
    "product": product == null ? null : product,
    "order_group": orderGroup == null ? null : orderGroup,
    "quantity": quantity == null ? null : quantity,
    "item": item == null ? null : item!.toJson(),
    "createdAt": createdAt == null ? null : createdAt,
    "updatedAt": updatedAt == null ? null : updatedAt,
    "code": code == null ? null : code,
  };

  @override
  List<Object?> get props => [recoverer, total, status, statusPayment, id, product, orderGroup, quantity, item, createdAt, updatedAt, code];
}