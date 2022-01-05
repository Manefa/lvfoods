import 'package:ivfoods_mobile_app/features/restaurant_features/get_restaurant/data/models/product_model.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_restaurant/data/models/hour_element_model.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_restaurant/data/models/phone_model.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_restaurant/data/models/styles_model.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_restaurant/domain/entities/restaurant.dart';

class RestaurantModel  extends Restaurant{
  RestaurantModel({
    required String? name,
    required String? email,
    required String? description,
    required String? address,
    required String? country,
    required String? city,
    required String? district,
    required String? profilePicture,
    required String? coverPicture,
    required List<PhoneModel>? phones,
    required List<HourElementModel>? hours,
    required double? note,
    required List<ProductModel>? products,
    required List<StyleModel>? styles,
    required String? status,
    required String? createdAt,
  }) : super(
    name: name,
    email: email,
    description: description,
    address: address,
    country: country,
    city: city,
    district: district,
    profilePicture: profilePicture,
    coverPicture: coverPicture,
    phones: phones,
    hours: hours,
    note: note,
    products: products,
    styles: styles,
    status: status,
    createdAt: createdAt,
  );


  factory RestaurantModel.fromJson(Map<String, dynamic> json) => RestaurantModel(
    name: json["name"] == null ? null : json["name"],
    email: json["email"] == null ? null : json["email"],
    description: json["description"] == null ? null : json["description"],
    address: json["address"] == null ? null : json["address"],
    country: json["country"] == null ? null : json["country"],
    city: json["city"] == null ? null : json["city"],
    district: json["district"] == null ? null : json["district"],
    profilePicture: json["profile_picture"] == null ? null : json["profile_picture"],
    coverPicture: json["cover_picture"] == null ? null : json["cover_picture"],
    phones: json["phones"] == null ? null : List<PhoneModel>.from(json["phones"].map((x) => PhoneModel.fromJson(x))),
    hours: json["hours"] == null ? null : List<HourElementModel>.from(json["hours"].map((x) => HourElementModel.fromJson(x))),
    note: json["note"] == null ? null : (json["note"] as num).toDouble(),
    products: json["products"] == null ? null : List<ProductModel>.from(json["products"].map((x) => ProductModel.fromJson(x))),
    styles: json["styles"] == null ? null : List<StyleModel>.from(json["styles"].map((x) => StyleModel.fromJson(x))),
    status: json["status"] == null ? null : json["status"],
    createdAt: json["createdAt"] == null ? null : json["createdAt"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "email": email == null ? null : email,
    "description": description == null ? null : description,
    "address": address == null ? null : address,
    "country": country == null ? null : country,
    "city": city == null ? null : city,
    "district": district == null ? null : district,
    "profile_picture": profilePicture == null ? null : profilePicture,
    "cover_picture": coverPicture == null ? null : coverPicture,
    "phones": phones == null ? null : List<dynamic>.from(phones!.map((x) => x.toJson())),
    "hours": hours == null ? null : List<dynamic>.from(hours!.map((x) => x.toJson())),
    "note": note == null ? null : note,
    "products": products == null ? null : List<dynamic>.from(products!.map((x) => x.toJson())),
    "styles": styles == null ? null : List<dynamic>.from(styles!.map((x) => x.toJson())),
    "status": status == null ? null : status,
    "createdAt": createdAt == null ? null : createdAt,
  };

  @override
  List<Object?> get props => [name, email, description, address, country, city, district, profilePicture, coverPicture, phones, hours, note, products, styles, status, createdAt];
}