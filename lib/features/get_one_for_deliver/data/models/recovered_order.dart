
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/data/models/product_model.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/domain/entities/recovered_order.dart';

class RecoveredOrderModel extends RecoveredOrder{

  RecoveredOrderModel({
    required final String? orderGroup,
    required final String? code,
    required final int? quantity,
    required final int? total,
    required final ProductModel? product,
    required final String? recoverer,
    required final ProductModel? item,
    required final String? statusPayment,
    required final String? status,
    required final String? id,
    required final String? createdAt,
    required final String? updatedAt,
  }) : super(
    orderGroup: orderGroup,
    code: code,
    quantity: quantity,
    total: total,
    product: product,
    recoverer: recoverer,
    item: item,
    statusPayment: statusPayment,
    status: status,
    id: id,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );

  factory RecoveredOrderModel.fromJson(Map<String, dynamic> json) => RecoveredOrderModel(
    orderGroup: json["order_group"] == null ? null : json["order_group"],
    code: json["code"] == null ? null : json["code"],
    quantity: json["quantity"] == null ? null : json["quantity"],
    total: json["total"] == null ? null : json["total"],
    product: json["product"] == null ? null : ProductModel.fromJson(json["product"]),
    recoverer: json["recoverer"] == null ? null : json["recoverer"],
    item: json["item"] == null ? null : ProductModel.fromJson(json["item"]),
    statusPayment: json["status_payment"] == null ? null : json["status_payment"],
    status: json["status"] == null ? null : json["status"],
    id: json["_id"] == null ? null : json["_id"],
    createdAt: json["createdAt"] == null ? null : json["createdAt"],
    updatedAt: json["updatedAt"] == null ? null : json["updatedAt"],
  );

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
}