import 'package:ivfoods_mobile_app/features/get_one_for_deliver/data/models/location_model.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/data/models/order_group_model.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/data/models/phone_model.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/data/models/user_model.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/domain/entities/delivery.dart';

class DeliveryModel extends Delivery{

  DeliveryModel({
    required final UserModel? deliver,
    required final OrderGroupModel? orderGroup,
    required final String? code,
    required final LocationModel? location,
    required final PhoneModel? phone,
    required final int? deliveryCharges,
    required final String? district,
    required final String? country,
    required final String? city,
    required final String? fullName,
    required final String? email,
    required final String? statusPayment,
    required final String? status,
    required final String? id,
    required final String? createdAt,
    required final String? updatedAt,
  }) : super(
    deliver: deliver,
    orderGroup: orderGroup,
    code: code,
    location: location,
    phone: phone,
    deliveryCharges: deliveryCharges,
    district: district,
    country: country,
    city: city,
    fullName: fullName,
    email: email,
    statusPayment: statusPayment,
    status: status,
    id: id,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );

  factory DeliveryModel.fromJson(Map<String, dynamic> json) => DeliveryModel(
    deliver: json["deliver"] == null ? null : UserModel.fromJson(json["deliver"]),
    orderGroup: json["order_group"] == null ? null : OrderGroupModel.fromJson(json["order_group"]),
    code: json["code"] == null ? null : json["code"],
    location: json["location"] == null ? null : LocationModel.fromJson(json["location"]),
    phone: json["phone"] == null ? null : PhoneModel.fromJson(json["phone"]),
    deliveryCharges: json["delivery_charges"] == null ? null : json["delivery_charges"],
    district: json["district"] == null ? null : json["district"],
    country: json["country"] == null ? null : json["country"],
    city: json["city"] == null ? null : json["city"],
    fullName: json["full_name"] == null ? null : json["full_name"],
    email: json["email"] == null ? null : json["email"],
    statusPayment: json["status_payment"] == null ? null : json["status_payment"],
    status: json["status"] == null ? null : json["status"],
    id: json["_id"] == null ? null : json["_id"],
    createdAt: json["createdAt"] == null ? null : json["createdAt"],
    updatedAt: json["updatedAt"] == null ? null : json["updatedAt"],
  );

  Map<String, dynamic> toJson() => {
    "deliver": deliver == null ? null : deliver!.toJson(),
    "order_group": orderGroup == null ? null : orderGroup!.toJson(),
    "code": code == null ? null : code,
    "location": location == null ? null : location!.toJson(),
    "phone": phone == null ? null : phone!.toJson(),
    "delivery_charges": deliveryCharges == null ? null : deliveryCharges,
    "district": district == null ? null : district,
    "country": country == null ? null : country,
    "city": city == null ? null : city,
    "full_name": fullName == null ? null : fullName,
    "email": email == null ? null : email,
    "status_payment": statusPayment == null ? null : statusPayment,
    "status": status == null ? null : status,
    "_id": id == null ? null : id,
    "createdAt": createdAt == null ? null : createdAt,
    "updatedAt": updatedAt == null ? null : updatedAt,
  };
}