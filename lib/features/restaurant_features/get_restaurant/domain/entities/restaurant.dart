import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_restaurant/domain/entities/hour_element.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_restaurant/domain/entities/phone.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_restaurant/domain/entities/styles.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_restaurant/domain/entities/product.dart';

class Restaurant  extends Equatable{
  final String? name;
  final String? email;
  final String? description;
  final String? address;
  final String? country;
  final String? city;
  final String? district;
  final String? profilePicture;
  final String? coverPicture;
  final List<Phone>? phones;
  final List<HourElement>? hours;
  final double? note;
  final List<Product>? products;
  final List<Styles>? styles;
  final String? status;
  final String? createdAt;

  Restaurant({
    required this.name,
    required this.email,
    required this.description,
    required this.address,
    required this.country,
    required this.city,
    required this.district,
    required this.profilePicture,
    required this.coverPicture,
    required this.phones,
    required this.hours,
    required this.note,
    required this.products,
    required this.styles,
    required this.status,
    required this.createdAt,
  });


  // factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
  //   name: json["name"] == null ? null : json["name"],
  //   email: json["email"] == null ? null : json["email"],
  //   description: json["description"] == null ? null : json["description"],
  //   address: json["address"] == null ? null : json["address"],
  //   profilePicture: json["profile_picture"] == null ? null : json["profile_picture"],
  //   phones: json["phones"] == null ? null : List<Phone>.from(json["phones"].map((x) => Phone.fromJson(x))),
  //   hours: json["hours"] == null ? null : List<HourElement>.from(json["hours"].map((x) => HourElement.fromJson(x))),
  //   note: json["note"] == null ? null : json["note"],
  //   products: json["products"] == null ? null : List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
  //   styles: json["styles"] == null ? null : List<Style>.from(json["styles"].map((x) => Style.fromJson(x))),
  //   status: json["status"] == null ? null : json["status"],
  //   createdAt: json["createdAt"] == null ? null : msgValues.map[json["createdAt"]],
  // );

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
  List<Object?> get props => [name, email, description, address, country, city, district, profilePicture, coverPicture,phones, hours, note, products, styles, status, createdAt];
}
