import 'dart:io';

import 'package:equatable/equatable.dart';

class ForCreateRestaurant extends Equatable{

  final String? name;
  final String? email;
  final String? description;
  final String? address;
  final String? country;
  final String? city;
  final String? district;
  final double? latitude;
  final double? longitude;
  final String? styles;
  final String? codes;
  final String? contents;
  final String? day;
  final String? hours;
  final File? profilePicture;
  final File? coverPicture;

  ForCreateRestaurant({
    required final this.name,
    required final this.email,
    required final this.description,
    required final this.address,
    required final this.country,
    required final this.city,
    required final this.district,
    final this.latitude,
    final this.longitude,
    final this.styles,
    final this.codes,
    final this.contents,
    final this.day,
    final this.hours,
    required final this.profilePicture,
    required final this.coverPicture,
  });

  // factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
  //   name: json["name"] == null ? null : msgValues.map[json["name"]],
  //   email: json["email"] == null ? null : msgValues.map[json["email"]],
  //   description: json["description"] == null ? null : msgValues.map[json["description"]],
  //   address: json["address"] == null ? null : msgValues.map[json["address"]],
  //   profilePicture: json["profile_picture"] == null ? null : msgValues.map[json["profile_picture"]],
  //   coverPicture: json["cover_picture"] == null ? null : msgValues.map[json["cover_picture"]],
  //   reference: json["reference"] == null ? null : msgValues.map[json["reference"]],
  //   code: json["code"] == null ? null : msgValues.map[json["code"]],
  //   phones: json["phones"] == null ? null : List<Phone>.from(json["phones"].map((x) => Phone.fromJson(x))),
  //   hours: json["hours"] == null ? null : List<HourElement>.from(json["hours"].map((x) => HourElement.fromJson(x))),
  //   note: json["note"] == null ? null : json["note"],
  //   user: json["user"] == null ? null : User.fromJson(json["user"]),
  //   products: json["products"] == null ? null : List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
  //   styles: json["styles"] == null ? null : List<Style>.from(json["styles"].map((x) => Style.fromJson(x))),
  //   usersFavorites: json["users_favorites"] == null ? null : List<User>.from(json["users_favorites"].map((x) => User.fromJson(x))),
  //   geographicCoordinates: json["geographic_coordinates"] == null ? null : GeographicCoordinates.fromJson(json["geographic_coordinates"]),
  //   status: json["status"] == null ? null : json["status"],
  //   id: json["_id"] == null ? null : msgValues.map[json["_id"]],
  //   createdAt: json["createdAt"] == null ? null : msgValues.map[json["createdAt"]],
  //   updatedAt: json["updatedAt"] == null ? null : msgValues.map[json["updatedAt"]],
  // );

  // Map<String, dynamic> toJson() => {
  //   "name": name == null ? null : msgValues.reverse[name],
  //   "email": email == null ? null : msgValues.reverse[email],
  //   "description": description == null ? null : msgValues.reverse[description],
  //   "address": address == null ? null : msgValues.reverse[address],
  //   "profile_picture": profilePicture == null ? null : msgValues.reverse[profilePicture],
  //   "cover_picture": coverPicture == null ? null : msgValues.reverse[coverPicture],
  //   "reference": reference == null ? null : msgValues.reverse[reference],
  //   "code": code == null ? null : msgValues.reverse[code],
  //   "phones": phones == null ? null : List<dynamic>.from(phones.map((x) => x.toJson())),
  //   "hours": hours == null ? null : List<dynamic>.from(hours.map((x) => x.toJson())),
  //   "note": note == null ? null : note,
  //   "user": user == null ? null : user.toJson(),
  //   "products": products == null ? null : List<dynamic>.from(products.map((x) => x.toJson())),
  //   "styles": styles == null ? null : List<dynamic>.from(styles.map((x) => x.toJson())),
  //   "users_favorites": usersFavorites == null ? null : List<dynamic>.from(usersFavorites.map((x) => x.toJson())),
  //   "geographic_coordinates": geographicCoordinates == null ? null : geographicCoordinates.toJson(),
  //   "status": status == null ? null : status,
  //   "_id": id == null ? null : msgValues.reverse[id],
  //   "createdAt": createdAt == null ? null : msgValues.reverse[createdAt],
  //   "updatedAt": updatedAt == null ? null : msgValues.reverse[updatedAt],
  // };

  @override
  List<Object?> get props => [name, email, description, address, country, city, district, latitude, longitude, styles,
    codes, contents, profilePicture, coverPicture];
}