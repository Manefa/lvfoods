import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/domain/entities/delivery.dart';
import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/domain/entities/user.dart';

class OrderGroup extends Equatable{
  final User? user;
  final String? code;
  final String? orders;
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
    "user": user!.toJson(),
    "code": code,
    "orders": orders,
    "delivery": delivery!.toJson(),
    "total_price": totalPrice,
    "status_payment": statusPayment,
    "status": status,
    "_id": id,
  };

  @override
  List<Object?> get props => [user, code, orders, delivery, totalPrice, statusPayment, status, id];
}