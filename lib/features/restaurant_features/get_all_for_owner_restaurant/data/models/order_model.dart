import 'package:ivfoods_mobile_app/features/restaurant_features/get_all_for_owner_restaurant/data/models/product_model.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_all_for_owner_restaurant/domain/entities/order.dart';

class OrderModel extends Order{
  OrderModel({
    required String? code,
    required double? quantity,
    required double? total,
    required ProductModel? item,
    required String? status,
    required String? createdAt,
  }) : super(
    code: code,
    quantity: quantity,
    total: total,
    item: item,
    status: status,
    createdAt: createdAt,
  );

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    code: json["code"] == null ? null : json["code"],
    quantity: json["quantity"] == null ? null : (json["quantity"] as num).toDouble(),
    total: json["total"] == null ? null : (json["total"] as num).toDouble(),
    item: json["item"] == null ? null : ProductModel.fromJson(json["item"]),
    status: json["status"] == null ? null : json["status"],
    createdAt: json["createdAt"] == null ? null : json["createdAt"],
  );

  Map<String, dynamic> toJson() => {
    "code": code == null ? null : code,
    "quantity": quantity == null ? null : quantity,
    "total": total == null ? null : total,
    "item": item == null ? null : item!.toJson(),
    "status": status == null ? null : status,
    "createdAt": createdAt == null ? null : createdAt,
  };

  @override
  List<Object?> get props => [code, quantity, total, item, status, createdAt];
}