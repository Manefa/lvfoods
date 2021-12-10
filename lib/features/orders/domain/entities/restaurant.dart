import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/orders/domain/entities/geographic_coordinates.dart';
import 'package:ivfoods_mobile_app/features/orders/domain/entities/hour_element.dart';
import 'package:ivfoods_mobile_app/features/orders/domain/entities/phone.dart';
import 'package:ivfoods_mobile_app/features/orders/domain/entities/product.dart';
import 'package:ivfoods_mobile_app/features/orders/domain/entities/style.dart';
import 'package:ivfoods_mobile_app/features/orders/domain/entities/user.dart';

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
  final String? user;
  final List<String>? products;
  final List<String>? styles;
  final List<User>? usersFavorites;
  final GeographicCoordinates? geographicCoordinates;
  final String? status;
  final String? id;

  Restaurant({
    required final this.name,
    required final this.email,
    required final this.description,
    required final this.address,
    required final this.profilePicture,
    required final this.coverPicture,
    required final this.reference,
    required final this.code,
    required final this.phones,
    required final this.hours,
    required final this.user,
    required final this.products,
    required final this.styles,
    required final this.usersFavorites,
    final this.geographicCoordinates,
    required final this.status,
    required final this.id,
  });

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "description": description,
    "address": address,
    "profile_picture": profilePicture,
    "cover_picture": coverPicture,
    "reference": reference,
    "code": code,
    "phones": List<Phone>.from(phones!.map((x) => x.toJson())),
    "hours": List<HourElement>.from(hours!.map((x) => x.toJson())),
    "user": user,
    "products": List<Product>.from(products!.map((x) => x)),
    "styles": List<Style>.from(styles!.map((x) => x)),
    "users_favorites": List<User>.from(usersFavorites!.map((x) => x.toJson())),
    "geographic_coordinates": geographicCoordinates!.toJson(),
    "status": status,
    "_id": id,
  };

  @override
  List<Object?> get props => [name, email, description, address, profilePicture, coverPicture, reference,
  code, phones, hours, user, products, styles, usersFavorites, geographicCoordinates,
  status, id,];
}