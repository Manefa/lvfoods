import 'package:ivfoods_mobile_app/features/orders/data/models/location_model.dart';
import 'package:ivfoods_mobile_app/features/orders/domain/entities/my_deliveries.dart';

class MyDeliveriesModel extends MyDeliveries{
  MyDeliveriesModel({
    required final String? deliver,
    required final String? orderGroup,
    required final String? code,
    required final LocationModel? location,
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

  factory MyDeliveriesModel.fromJson(Map<String, dynamic> json) => MyDeliveriesModel(
    deliver: json["deliver"],
    orderGroup: json["order_group"],
    code: json["code"],
    location: LocationModel.fromJson(json["location"]),
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