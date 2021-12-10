import 'package:ivfoods_mobile_app/features/get_one_for_deliver/data/models/location_model.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/data/models/phone_model.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/domain/entities/deliveries_emplacement.dart';

class DeliveriesEmplacementModel extends DeliveriesEmplacement{

  DeliveriesEmplacementModel({
    required final String? user,
    required final String? code,
    required final LocationModel? location,
    required final PhoneModel? phone,
    required final String? district,
    required final String? country,
    required final String? city,
    required final bool? primary,
    required final String? id,
    required final String? createdAt,
    required final String? updatedAt,
  }) : super(
    user: user,
    code: code,
    location: location,
    phone: phone,
    district: district,
    country: country,
    city: city,
    primary: primary,
    id: id,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );

  factory DeliveriesEmplacementModel.fromJson(Map<String, dynamic> json) => DeliveriesEmplacementModel(
    user: json["user"] == null ? null : json["user"],
    code: json["code"] == null ? null : json["code"],
    location: json["location"] == null ? null : LocationModel.fromJson(json["location"]),
    phone: json["phone"] == null ? null : PhoneModel.fromJson(json["phone"]),
    district: json["district"] == null ? null : json["district"],
    country: json["country"] == null ? null : json["country"],
    city: json["city"] == null ? null : json["city"],
    primary: json["primary"] == null ? null : json["primary"],
    id: json["_id"] == null ? null : json["_id"],
    createdAt: json["createdAt"] == null ? null : json["createdAt"],
    updatedAt: json["updatedAt"] == null ? null : json["updatedAt"],
  );

  Map<String, dynamic> toJson() => {
    "user": user == null ? null : user,
    "code": code == null ? null : code,
    "location": location == null ? null : location!.toJson(),
    "phone": phone == null ? null : phone!.toJson(),
    "district": district == null ? null : district,
    "country": country == null ? null : country,
    "city": city == null ? null : city,
    "primary": primary == null ? null : primary,
    "_id": id == null ? null : id,
    "createdAt": createdAt == null ? null : createdAt,
    "updatedAt": updatedAt == null ? null : updatedAt,
  };
}