import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_all_for_owner_restaurant/domain/entities/product.dart';

class Order extends Equatable{
  final String? code;
  final double? quantity;
  final double? total;
  final Product? item;
  final String? status;
  final String? createdAt;

  Order({
    required this.code,
    required this.quantity,
    required this.total,
    required this.item,
    required this.status,
    required this.createdAt,
  });

  // factory Order.fromJson(Map<String, dynamic> json) => Order(
  //   code: json["code"] == null ? null : idValues.map[json["code"]],
  //   quantity: json["quantity"] == null ? null : json["quantity"],
  //   total: json["total"] == null ? null : json["total"],
  //   product: json["product"] == null ? null : Item.fromJson(json["product"]),
  //   item: json["item"] == null ? null : Product.fromJson(json["item"]),
  //   status: json["status"] == null ? null : json["status"],
  //   createdAt: json["createdAt"] == null ? null : json["createdAt"],
  // );

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