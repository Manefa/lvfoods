import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/domain/entities/location.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/domain/entities/order_group.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/domain/entities/phone.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/domain/entities/user.dart';

class Delivery extends Equatable{
  final User? deliver;
  final OrderGroup? orderGroup;
  final String? code;
  final Location? location;
  final Phone? phone;
  final int? deliveryCharges;
  final String? district;
  final String? country;
  final String? city;
  final String? fullName;
  final String? email;
  final String? statusPayment;
  final String? status;
  final String? id;
  final String? createdAt;
  final String? updatedAt;

  Delivery({
    required this.deliver,
    required this.orderGroup,
    required this.code,
    required this.location,
    required this.phone,
    required this.deliveryCharges,
    required this.district,
    required this.country,
    required this.city,
    required this.fullName,
    required this.email,
    required this.statusPayment,
    required this.status,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });

  // factory Delivery.fromJson(Map<String, dynamic> json) => Delivery(
  //   deliver: json["deliver"] == null ? null : Deliver.fromJson(json["deliver"]),
  //   orderGroup: json["order_group"] == null ? null : OrderGroup.fromJson(json["order_group"]),
  //   code: json["code"] == null ? null : msgValues.map[json["code"]],
  //   location: json["location"] == null ? null : Location.fromJson(json["location"]),
  //   phone: json["phone"] == null ? null : Phone.fromJson(json["phone"]),
  //   deliveryCharges: json["delivery_charges"] == null ? null : json["delivery_charges"],
  //   district: json["district"] == null ? null : msgValues.map[json["district"]],
  //   country: json["country"] == null ? null : msgValues.map[json["country"]],
  //   city: json["city"] == null ? null : msgValues.map[json["city"]],
  //   fullName: json["full_name"] == null ? null : msgValues.map[json["full_name"]],
  //   email: json["email"] == null ? null : msgValues.map[json["email"]],
  //   statusPayment: json["status_payment"] == null ? null : json["status_payment"],
  //   status: json["status"] == null ? null : json["status"],
  //   id: json["_id"] == null ? null : msgValues.map[json["_id"]],
  //   createdAt: json["createdAt"] == null ? null : msgValues.map[json["createdAt"]],
  //   updatedAt: json["updatedAt"] == null ? null : msgValues.map[json["updatedAt"]],
  // );

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

  @override
  List<Object?> get props => [deliver, orderGroup, code, location, phone, deliveryCharges, district, country,
  city, fullName, email, statusPayment, status, id, createdAt, updatedAt];
}