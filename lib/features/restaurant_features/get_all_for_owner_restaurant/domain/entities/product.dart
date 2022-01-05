import 'package:equatable/equatable.dart';

class Product extends Equatable{
  final String? name;
  final String? description;
  final String? picture;
  final String? code;
  final double? price;
  final double? note;
  final double? discount;
  final String? status;
  final String? createdAt;

  Product({
    required this.name,
    required this.description,
    required this.picture,
    required this.code,
    required this.price,
    required this.note,
    required this.discount,
    required this.status,
    required this.createdAt,
  });

  // factory Product.fromJson(Map<String, dynamic> json) => Product(
  //   name: json["name"] == null ? null : json["name"],
  //   description: json["description"] == null ? null : json["description"],
  //   picture: json["picture"] == null ? null : json["picture"],
  //   code: json["code"] == null ? null : json["code"],
  //   price: json["price"] == null ? null : json["price"],
  //   note: json["note"] == null ? null : json["note"],
  //   discount: json["discount"] == null ? null : json["discount"],
  //   status: json["status"] == null ? null : json["status"],
  //   createdAt: json["createdAt"] == null ? null : json["createdAt"],
  // );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "description": description == null ? null : description,
    "picture": picture == null ? null : picture,
    "code": code == null ? null : code,
    "price": price == null ? null : price,
    "note": note == null ? null : note,
    "discount": discount == null ? null : discount,
    "status": status == null ? null : status,
    "createdAt": createdAt == null ? null : createdAt,
  };

  @override
  List<Object?> get props => [name, description, picture, code, price, note, discount, status, createdAt];
}