import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/orders/domain/entities/delivery.dart';

class OrderGroup extends Equatable{
  final String? user;
  final String? code;
  final List<String>? orders;
  final Delivery? delivery;
  final int? totalPrice;
  final String? statusPayment;
  final String? status;
  final String? id;

  OrderGroup({
    required final this.user,
    required final this.code,
    required final this.orders,
    required final this.delivery,
    required final this.totalPrice,
    required final this.statusPayment,
    required final this.status,
    required final this.id,
  });

  Map<String, dynamic> toJson() => {
    "user": user,
    "code": code,
    "orders": List<String>.from(orders!.map((x) => x)),
    "delivery": delivery!.toJson(),
    "total_price": totalPrice,
    "status_payment": statusPayment,
    "status": status,
    "_id": id,
  };

  @override
  List<Object?> get props => [user, code, orders, delivery, totalPrice, statusPayment, status, id];
}