import 'package:ivfoods_mobile_app/features/deliveries/data/models/product_model.dart';
import 'package:ivfoods_mobile_app/features/deliveries/domain/entities/order.dart';

class OrderModel extends Order{
  OrderModel({
    required ProductModel? item,
    required int? quantity,
    required String? statusPayment,
    required String? status,
  }) : super(
    item: item,
    quantity: quantity,
    statusPayment: statusPayment,
    status: status,
  );

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    item: json["item"] == null ? null : ProductModel.fromJson(json["item"]),
    quantity: json["quantity"] == null ? null : json["quantity"],
    statusPayment: json["status_payment"] == null ? null : json["status_payment"],
    status: json["status"] == null ? null : json["status"],
  );

  Map<String, dynamic> toJson() => {
    "item": item == null ? null : item!.toJson(),
    "quantity": quantity == null ? null : quantity,
  };
}