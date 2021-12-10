
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/data/models/hour_element_model.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/data/models/location_model.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/data/models/phone_model.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/domain/entities/restaurant.dart';

class RestaurantModel extends Restaurant{
  RestaurantModel({
    required final String? name,
    required final String? email,
    required final String? description,
    required final String? address,
    required final String? profilePicture,
    required final String? coverPicture,
    required final String? reference,
    required final String? code,
    required final List<PhoneModel>? phones,
    required final List<HourElementModel>? hours,
    required final double? note,
    required final String? user,
    required final List<String>? products,
    required final List<String>? usersFavorites,
    required final LocationModel? geographicCoordinates,
    required final String? status,
    required final String? id,
    required final String? createdAt,
    required final String? updatedAt,
  }) : super(
    name: name,
    email: email,
    description: description,
    address: address,
    profilePicture: profilePicture,
    coverPicture: coverPicture,
    reference: reference,
    code: code,
    phones: phones,
    hours: hours,
    note: note,
    user: user,
    products: products,
    usersFavorites: usersFavorites,
    geographicCoordinates: geographicCoordinates,
    status: status,
    id: id,
    createdAt: createdAt,
    updatedAt: updatedAt,

  );

  factory RestaurantModel.fromJson(Map<String, dynamic> json) => RestaurantModel(
    name: json["name"] == null ? null : json["name"],
    email: json["email"] == null ? null : json["email"],
    description: json["description"] == null ? null : json["description"],
    address: json["address"] == null ? null : json["address"],
    profilePicture: json["profile_picture"] == null ? null : json["profile_picture"],
    coverPicture: json["cover_picture"] == null ? null : json["cover_picture"],
    reference: json["reference"] == null ? null : json["reference"],
    code: json["code"] == null ? null : json["code"],
    phones: json["phones"] == null ? null : List<PhoneModel>.from(json["phones"].map((x) => PhoneModel.fromJson(x))),
    hours: json["hours"] == null ? null : List<HourElementModel>.from(json["hours"].map((x) => HourElementModel.fromJson(x))),
    note: json["note"] == null ? null : (json["note"] as num).toDouble(),
    user: json["user"] == null ? null : json["user"],
    products: json["products"] == null ? null : List<String>.from(json["products"].map((x) => x)),
    usersFavorites: json["users_favorites"] == null ? null : List<String>.from(json["users_favorites"].map((x) => x)),
    geographicCoordinates: json["geographic_coordinates"] == null ? null : LocationModel.fromJson(json["geographic_coordinates"]),
    status: json["status"] == null ? null : json["status"],
    id: json["_id"] == null ? null : json["_id"],
    createdAt: json["createdAt"] == null ? null : json["createdAt"],
    updatedAt: json["updatedAt"] == null ? null : json["updatedAt"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "email": email == null ? null : email,
    "description": description == null ? null : description,
    "address": address == null ? null : address,
    "profile_picture": profilePicture == null ? null : profilePicture,
    "cover_picture": coverPicture == null ? null : coverPicture,
    "reference": reference == null ? null : reference,
    "code": code == null ? null : code,
    "phones": phones == null ? null : List<dynamic>.from(phones!.map((x) => x.toJson())),
    "hours": hours == null ? null : List<dynamic>.from(hours!.map((x) => x.toJson())),
    "note": note == null ? null : note,
    "user": user == null ? null : user,
    "products": products == null ? null : List<dynamic>.from(products!.map((x) => x)),
    "users_favorites": usersFavorites == null ? null : List<dynamic>.from(usersFavorites!.map((x) => x)),
    "geographic_coordinates": geographicCoordinates == null ? null : geographicCoordinates!.toJson(),
    "status": status == null ? null : status,
    "_id": id == null ? null : id,
    "createdAt": createdAt == null ? null : createdAt,
    "updatedAt": updatedAt == null ? null : updatedAt,
  };
}