import 'package:ivfoods_mobile_app/features/deliveries/data/models/order_group_model.dart';
import 'package:ivfoods_mobile_app/features/deliveries/domain/entities/delivery.dart';

class DeliveryModel extends Delivery{
  DeliveryModel({
    String? statusPayment,
    String? status,
    OrderGroupModel? orderGroup,
    String? createdAt,
    String? code,
    String? city,
    String? country,
    String? district,
  }) : super(
    statusPayment: statusPayment,
    status: status,
    orderGroup: orderGroup,
    createdAt: createdAt,
    code: code,
    city: city,
    country: country,
    district: district,
  );

  factory DeliveryModel.fromJson(Map<String, dynamic> json) => DeliveryModel(
    statusPayment: json["status_payment"] == null ? null : json["status_payment"],
    status: json["status"] == null ? null : json["status"],
    orderGroup: json["order_group"] == null ? null : OrderGroupModel.fromJson(json["order_group"]),
    createdAt: json["createdAt"] == null ? null : json["createdAt"],
    code: json["code"] == null ? null : json["code"],
    city: json["city"] == null ? null : json["city"],
    country: json["country"] == null ? null : json["country"],
    district: json["district"] == null ? null : json["district"],
  );

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
}