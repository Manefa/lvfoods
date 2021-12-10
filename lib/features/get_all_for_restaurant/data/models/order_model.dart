import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/data/models/product_model.dart';
import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/domain/entities/order.dart';

class OrderModel extends Order{
  OrderModel({
    required final String? orderGroup,
    required final String? code,
    required final int? quantity,
    required final int? total,
    required final String? product,
    required final ProductModel? item,
    required final String? statusPayment,
    required final String? status,
    required final String? id,
  }) : super(
    orderGroup: orderGroup,
    code: code,
    quantity: quantity,
    total: total,
    product: product,
    item: item,
    statusPayment: statusPayment,
    status: status,
    id: id,
  );

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    orderGroup: json["order_group"],
    code: json["code"],
    quantity: json["quantity"],
    total: json["total"],
    product: json["product"],
    item: ProductModel.fromJson(json["item"]),
    statusPayment: json["status_payment"],
    status: json["status"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "order_group": orderGroup,
    "code": code,
    "quantity": quantity,
    "total": total,
    "product": product,
    "item": item!.toJson(),
    "status_payment": statusPayment,
    "status": status,
    "_id": id,
  };
}