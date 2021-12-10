import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/orders/domain/entities/geographic_coordinates.dart';

class Delivery extends Equatable{
  final String? deliver;
  final String? orderGroup;
  final String? code;
  final GeographicCoordinates? location;
  final int? deliveryCharges;
  final String? address;
  final String? city;
  final String? statusPayment;
  final String? status;
  final String? id;

  Delivery({
    required final this.deliver,
    required final this.orderGroup,
    required final this.code,
    required final this.location,
    required final this.deliveryCharges,
    required final this.address,
    required final this.city,
    required final this.statusPayment,
    required final this.status,
    required final this.id,
  });

  Map<String, dynamic> toJson() => {
    "deliver": deliver,
    "order_group": orderGroup,
    "code": code,
    "location": location!.toJson(),
    "delivery_charges": deliveryCharges,
    "address": address,
    "city": city,
    "status_payment": statusPayment,
    "status": status,
    "_id": id,
  };

  @override
  List<Object?> get props => [deliver, orderGroup, code, location, deliveryCharges, address,
  city, statusPayment, status, id];
}