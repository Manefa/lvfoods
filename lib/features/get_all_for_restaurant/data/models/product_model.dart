import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/domain/entities/product.dart';

class ProductModel extends Product{
  ProductModel({
    required final String? name,
    required final String? description,
    required final String? picture,
    required final String? code,
    required final int? price,
    required final double? note,
    required final int? discount,
    required final List<String>? notices,
    required final List<String>? categories,
    required final List<String>? usersFavorites,
    required final List<String>? orders,
    required final String? status,
    required final String? id,
  }) : super(
    name: name,
    description: description,
    picture: picture,
    code: code,
    price: price,
    note: note,
    discount: discount,
    notices: notices,
    categories: categories,
    usersFavorites: usersFavorites,
    orders: orders,
    status: status,
    id: id,
  );

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    name: json["name"],
    description: json["description"],
    picture: json["picture"],
    code: json["code"],
    price: json["price"],
    note: (json["note"] as num).toDouble(),
    discount: json["discount"],
    notices: List<String>.from(json["notices"].map((x) => x)),
    categories: List<String>.from(json["categories"].map((x) => x)),
    usersFavorites: List<String>.from(json["users_favorites"].map((x) => x)),
    orders: List<String>.from(json["orders"].map((x) => x)),
    status: json["status"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "description": description,
    "picture": picture,
    "code": code,
    "price": price,
    "note": note,
    "discount": discount,
    "notices": List<String>.from(notices!.map((x) => x)),
    "categories": categories,
    "users_favorites": List<String>.from(usersFavorites!.map((x) => x)),
    "orders": List<dynamic>.from(orders!.map((x) => x)),
    "status": status,
    "_id": id,
  };
}