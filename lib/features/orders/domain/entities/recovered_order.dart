import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/orders/domain/entities/order_group.dart';
import 'package:ivfoods_mobile_app/features/orders/domain/entities/product.dart';

class RecoveredOrder extends Equatable{
  final OrderGroup? orderGroup;
  final String? code;
  final int? quantity;
  final int? total;
  final Product? product;
  final String? recoverer;
  final Product? item;
  final String? statusPayment;
  final String? status;
  final String? id;

  RecoveredOrder({
    required final this.orderGroup,
    required final this.code,
    required final this.quantity,
    required final this.total,
    required final this.product,
    required final this.recoverer,
    required final this.item,
    required final this.statusPayment,
    required final this.status,
    required final this.id,
  });

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

  @override
  List<Object?> get props => [orderGroup, code, quantity, total, product, recoverer, item,
  statusPayment, status, id];
}