import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/data/models/geographic_coordinates_model.dart';
import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/data/models/hour_element_model.dart';
import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/data/models/phone_model.dart';
import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/data/models/product_model.dart';
import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/data/models/style_model.dart';
import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/data/models/user_model.dart';
import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/domain/entities/restaurant.dart';

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
    required final List<String>? styles,
    required final List<UserModel>? usersFavorites,
    final GeographicCoordinatesModel? geographicCoordinates,
    required final String? status,
    required final String? id,
    required final String? createdAt,
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
    styles: styles,
    usersFavorites: usersFavorites,
    geographicCoordinates: geographicCoordinates,
    status: status,
    id: id,
    createdAt: createdAt,
  );

  factory RestaurantModel.fromJson(Map<String, dynamic> json) => RestaurantModel(
    name: json["name"],
    email: json["email"],
    description: json["description"],
    address: json["address"],
    profilePicture: json["profile_picture"],
    coverPicture: json["cover_picture"],
    reference: json["reference"],
    code: json["code"],
    phones: List<PhoneModel>.from(json["phones"].map((x) => PhoneModel.fromJson(x))),
    hours: List<HourElementModel>.from(json["hours"].map((x) => HourElementModel.fromJson(x))),
    note: (json["note"]).toDouble(),
    user: json["user"],
    products: List<String>.from(json["products"].map((x) => x)),
    styles: List<String>.from(json["styles"].map((x) => x)),
    usersFavorites: List<UserModel>.from(json["users_favorites"].map((x) => UserModel.fromJson(x))),
    geographicCoordinates: json["geographic_coordinates"] == null ? null : GeographicCoordinatesModel.fromJson(json["geographic_coordinates"]),
    status: json["status"],
    id: json["_id"],
    createdAt: json["createdAt"] == null ? null : json["createdAt"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "description": description,
    "address": address,
    "profile_picture": profilePicture,
    "cover_picture": coverPicture,
    "reference": reference,
    "code": code,
    "phones": List<PhoneModel>.from(phones!.map((x) => x.toJson())),
    "hours": List<HourElementModel>.from(hours!.map((x) => x.toJson())),
    "note": note,
    "user": user,
    "products": List<ProductModel>.from(products!.map((x) => x)),
    "styles": List<StyleModel>.from(styles!.map((x) => x)),
    "users_favorites": List<UserModel>.from(usersFavorites!.map((x) => x.toJson())),
    "geographic_coordinates": geographicCoordinates!.toJson(),
    "status": status,
    "_id": id,
    "createdAt": createdAt,
  };
}