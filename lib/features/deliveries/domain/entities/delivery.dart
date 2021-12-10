import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/deliveries/domain/entities/order_group.dart';

class Delivery extends Equatable{
  final String? statusPayment;
  final String? status;
  final OrderGroup? orderGroup;
  final String? createdAt;
  final String? code;
  final String? city;
  final String? country;
  final String? district;

  Delivery({
    required this.statusPayment,
    required this.status,
    required this.orderGroup,
    required this.createdAt,
    required this.code,
    required this.city,
    required this.country,
    required this.district,
  });

  Map<String, dynamic> toJson() => {
    "status_payment": statusPayment == null ? null : statusPayment,
    "status": status == null ? null : status,
    "order_group": orderGroup == null ? null : orderGroup!.toJson(),
    "createdAt": createdAt == null ? null : createdAt,
    "code": code == null ? null : code,
    "city": city == null ? null : city,
    "country": country == null ? null : country,
    "district": district == null ? null : district,
  };

  @override
  List<Object?> get props => [statusPayment, status, orderGroup, createdAt,
  code, city, country, district,];
}