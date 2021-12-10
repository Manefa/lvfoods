import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/domain/entities/location.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/domain/entities/phone.dart';

class DeliveriesEmplacement extends Equatable{
  final String? user;
  final String? code;
  final Location? location;
  final Phone? phone;
  final String? district;
  final String? country;
  final String? city;
  final bool? primary;
  final String? id;
  final String? createdAt;
  final String? updatedAt;

  DeliveriesEmplacement({
    required this.user,
    required this.code,
    required this.location,
    required this.phone,
    required this.district,
    required this.country,
    required this.city,
    required this.primary,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });

  // factory DeliveriesEmplacement.fromJson(Map<String, dynamic> json) => DeliveriesEmplacement(
  //   user: json["user"] == null ? null : json["user"],
  //   code: json["code"] == null ? null : json["code"],
  //   location: json["location"] == null ? null : Location.fromJson(json["location"]),
  //   phone: json["phone"] == null ? null : Phone.fromJson(json["phone"]),
  //   district: json["district"] == null ? null : json["district"],
  //   country: json["country"] == null ? null : json["country"],
  //   city: json["city"] == null ? null : json["city"],
  //   primary: json["primary"] == null ? null : json["primary"],
  //   id: json["_id"] == null ? null : json["_id"],
  //   createdAt: json["createdAt"] == null ? null : json["createdAt"],
  //   updatedAt: json["updatedAt"] == null ? null : json["updatedAt"],
  // );

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

  @override
  List<Object?> get props => [user, code, location, phone, district, country, city, primary, id, createdAt, updatedAt];
}