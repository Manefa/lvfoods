import 'package:ivfoods_mobile_app/features/orders/data/models/geographic_coordinates_model.dart';
import 'package:ivfoods_mobile_app/features/orders/domain/entities/delivery.dart';

class DeliveryModel extends Delivery{
  DeliveryModel({
    required final String? deliver,
    required final String? orderGroup,
    required final String? code,
    required final GeographicCoordinatesModel? location,
    required final int? deliveryCharges,
    required final String? address,
    required final String? city,
    required final String? statusPayment,
    required final String? status,
    required final String? id,
  }) : super(
    deliver: deliver,
    orderGroup: orderGroup,
    code: code,
    location: location,
    deliveryCharges: deliveryCharges,
    address: address,
    city: city,
    statusPayment: statusPayment,
    status: status,
    id: id,
  );

  factory DeliveryModel.fromJson(Map<String, dynamic> json) => DeliveryModel(
    deliver: json["deliver"],
    orderGroup: json["order_group"],
    code: json["code"],
    location: GeographicCoordinatesModel.fromJson(json["location"]),
    deliveryCharges: json["delivery_charges"],
    address: json["address"],
    city: json["city"],
    statusPayment: json["status_payment"],
    status: json["status"],
    id: json["_id"],
  );

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
}