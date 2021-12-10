import 'package:ivfoods_mobile_app/features/orders/data/models/order_group_model.dart';
import 'package:ivfoods_mobile_app/features/orders/data/models/product_model.dart';
import 'package:ivfoods_mobile_app/features/orders/domain/entities/recovered_order.dart';

class RecoveredOrderModel extends RecoveredOrder{
  RecoveredOrderModel({
    required final OrderGroupModel? orderGroup,
    required final String? code,
    required final int? quantity,
    required final int? total,
    required final ProductModel? product,
    required final String? recoverer,
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
    recoverer: recoverer,
    item: item,
    statusPayment: statusPayment,
    status: status,
    id: id,
  );

  factory RecoveredOrderModel.fromJson(Map<String, dynamic> json) => RecoveredOrderModel(
    orderGroup: OrderGroupModel.fromJson(json["order_group"]),
    code: json["code"],
    quantity: json["quantity"],
    total: json["total"],
    product: ProductModel.fromJson(json["product"]),
    recoverer: json["recoverer"],
    item: ProductModel.fromJson(json["item"]),
    statusPayment: json["status_payment"],
    status: json["status"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "order_group": orderGroup!.toJson(),
    "code": code,
    "quantity": quantity,
    "total": total,
    "product": product!.toJson(),
    "recoverer": recoverer,
    "item": item!.toJson(),
    "status_payment": statusPayment,
    "status": status,
    "_id": id,
  };
}