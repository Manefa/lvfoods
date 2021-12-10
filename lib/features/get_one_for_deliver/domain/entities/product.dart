import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/domain/entities/restaurant.dart';

class Product extends Equatable{
  final String? name;
  final String? description;
  final String? picture;
  final String? code;
  final int? price;
  final double? note;
  final int? discount;
  final Restaurant? restaurant;
  final List<String>? notices;
  final List<String>? usersFavorites;
  final List<String>? orders;
  final String? status;
  final String? id;
  final String? createdAt;
  final String? updatedAt;

  Product({
    required this.name,
    required this.description,
    required this.picture,
    required this.code,
    required this.price,
    required this.note,
    required this.discount,
    required this.restaurant,
    required this.notices,
    required this.usersFavorites,
    required this.orders,
    required this.status,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });

  // factory Product.fromJson(Map<String, dynamic> json) => Product(
  //   name: json["name"] == null ? null : msgValues.map[json["name"]],
  //   description: json["description"] == null ? null : msgValues.map[json["description"]],
  //   picture: json["picture"] == null ? null : msgValues.map[json["picture"]],
  //   code: json["code"] == null ? null : msgValues.map[json["code"]],
  //   price: json["price"] == null ? null : json["price"],
  //   note: json["note"] == null ? null : json["note"],
  //   discount: json["discount"] == null ? null : json["discount"],
  //   restaurant: json["restaurant"] == null ? null : Restaurant.fromJson(json["restaurant"]),
  //   notices: json["notices"] == null ? null : List<Msg>.from(json["notices"].map((x) => msgValues.map[x])),
  //   categories: json["categories"] == null ? null : List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
  //   usersFavorites: json["users_favorites"] == null ? null : List<Msg>.from(json["users_favorites"].map((x) => msgValues.map[x])),
  //   orders: json["orders"] == null ? null : List<Msg>.from(json["orders"].map((x) => msgValues.map[x])),
  //   status: json["status"] == null ? null : json["status"],
  //   id: json["_id"] == null ? null : msgValues.map[json["_id"]],
  //   createdAt: json["createdAt"] == null ? null : msgValues.map[json["createdAt"]],
  //   updatedAt: json["updatedAt"] == null ? null : msgValues.map[json["updatedAt"]],
  // );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "description": description == null ? null : description,
    "picture": picture == null ? null : picture,
    "code": code == null ? null : code,
    "price": price == null ? null : price,
    "note": note == null ? null : note,
    "discount": discount == null ? null : discount,
    "restaurant": restaurant == null ? null : restaurant!.toJson(),
    "notices": notices == null ? null : List<dynamic>.from(notices!.map((x) => x)),
    "users_favorites": usersFavorites == null ? null : List<dynamic>.from(usersFavorites!.map((x) => x)),
    "orders": orders == null ? null : List<dynamic>.from(orders!.map((x) => x)),
    "status": status == null ? null : status,
    "_id": id == null ? null : id,
    "createdAt": createdAt == null ? null : createdAt,
    "updatedAt": updatedAt == null ? null : updatedAt,
  };

  @override
  List<Object?> get props => [name, description, picture, code, price, note, discount, restaurant, notices, usersFavorites, orders, status, id, createdAt, updatedAt];
}