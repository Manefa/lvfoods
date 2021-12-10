
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/data/models/product_model.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/domain/entities/order.dart';

class OrderModel extends Order{
  OrderModel({
    required final String? recoverer,
    required final int? total,
    required final String? status,
    required final String? statusPayment,
    required final String? id,
    required final String? product,
    required final String? orderGroup,
    required final int? quantity,
    required final ProductModel? item,
    required final String? createdAt,
    required final String? updatedAt,
    required final String? code,
  }) : super(
    recoverer: recoverer,
    total: total,
    status: status,
    statusPayment: statusPayment,
    id: id,
    product: product,
    orderGroup: orderGroup,
    quantity: quantity,
    item: item,
    createdAt: createdAt,
    updatedAt: updatedAt,
    code: code,
  );

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    recoverer: json["recoverer"] == null ? null : json["recoverer"],
    total: json["total"] == null ? null : json["total"],
    status: json["status"] == null ? null : json["status"],
    statusPayment: json["status_payment"] == null ? null : json["status_payment"],
    id: json["_id"] == null ? null : json["_id"],
    product: json["product"] == null ? null : json["product"],
    orderGroup: json["order_group"] == null ? null : json["order_group"],
    quantity: json["quantity"] == null ? null : json["quantity"],
    item: json["item"] == null ? null : ProductModel.fromJson(json["item"]),
    createdAt: json["createdAt"] == null ? null : json["createdAt"],
    updatedAt: json["updatedAt"] == null ? null : json["updatedAt"],
    code: json["code"] == null ? null : json["code"],
  );

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
}