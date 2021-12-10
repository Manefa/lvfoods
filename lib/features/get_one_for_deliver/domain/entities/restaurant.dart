import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/domain/entities/hour_element.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/domain/entities/location.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/domain/entities/phone.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/domain/entities/style.dart';

class Restaurant extends Equatable{
  final String? name;
  final String? email;
  final String? description;
  final String? address;
  final String? profilePicture;
  final String? coverPicture;
  final String? reference;
  final String? code;
  final List<Phone>? phones;
  final List<HourElement>? hours;
  final double? note;
  final String? user;
  final List<String>? products;
  final List<String>? usersFavorites;
  final Location? geographicCoordinates;
  final String? status;
  final String? id;
  final String? createdAt;
  final String? updatedAt;

  Restaurant({
    required this.name,
    required this.email,
    required this.description,
    required this.address,
    required this.profilePicture,
    required this.coverPicture,
    required this.reference,
    required this.code,
    required this.phones,
    required this.hours,
    required this.note,
    required this.user,
    required this.products,
    required this.usersFavorites,
    required this.geographicCoordinates,
    required this.status,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
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
  //   user: json["user"] == null ? null : msgValues.map[json["user"]],
  //   products: json["products"] == null ? null : List<Msg>.from(json["products"].map((x) => msgValues.map[x])),
  //   styles: json["styles"] == null ? null : List<Style>.from(json["styles"].map((x) => Style.fromJson(x))),
  //   usersFavorites: json["users_favorites"] == null ? null : List<Msg>.from(json["users_favorites"].map((x) => msgValues.map[x])),
  //   geographicCoordinates: json["geographic_coordinates"] == null ? null : Location.fromJson(json["geographic_coordinates"]),
  //   status: json["status"] == null ? null : statusValues.map[json["status"]],
  //   id: json["_id"] == null ? null : msgValues.map[json["_id"]],
  //   createdAt: json["createdAt"] == null ? null : msgValues.map[json["createdAt"]],
  //   updatedAt: json["updatedAt"] == null ? null : msgValues.map[json["updatedAt"]],
  // );

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

  @override
  List<Object?> get props => [name, email, description, address, profilePicture, coverPicture, reference, code, phones,
  hours, note, user, products, usersFavorites, geographicCoordinates, status, id, createdAt, updatedAt];
}