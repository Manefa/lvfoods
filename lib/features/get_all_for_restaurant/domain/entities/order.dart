import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/domain/entities/product.dart';

class Order extends Equatable{
  final String? orderGroup;
  final String? code;
  final int? quantity;
  final int? total;
  final String? product;
  final Product? item;
  final String? statusPayment;
  final String? status;
  final String? id;

  Order({
    required final this.orderGroup,
    required final this.code,
    required final this.quantity,
    required final this.total,
    required final this.product,
    required final this.item,
    required final this.statusPayment,
    required final this.status,
    required final this.id,
  });

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

  @override
  List<Object?> get props => [orderGroup, code, quantity, total, quantity, total, product, item, statusPayment,
  status, id];
}