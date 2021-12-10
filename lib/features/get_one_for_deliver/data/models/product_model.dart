import 'package:ivfoods_mobile_app/features/get_one_for_deliver/data/models/restaurant_model.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/domain/entities/product.dart';

class ProductModel extends Product{
  ProductModel({
    required final String? name,
    required final String? description,
    required final String? picture,
    required final String? code,
    required final int? price,
    required final double? note,
    required final int? discount,
    required final RestaurantModel? restaurant,
    required final List<String>? notices,
    required final List<String>? usersFavorites,
    required final List<String>? orders,
    required final String? status,
    required final String? id,
    required final String? createdAt,
    required final String? updatedAt,
  }) : super(
    name: name,
    description: description,
    picture: picture,
    code: code,
    price: price,
    note: note,
    discount: discount,
    restaurant: restaurant,
    notices: notices,
    usersFavorites: usersFavorites,
    orders: orders,
    status: status,
    id: id,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    name: json["name"] == null ? null : json["name"],
    description: json["description"] == null ? null : json["description"],
    picture: json["picture"] == null ? null : json["picture"],
    code: json["code"] == null ? null : json["code"],
    price: json["price"] == null ? null : json["price"],
    note: json["note"] == null ? null : (json["note"] as num).toDouble(),
    discount: json["discount"] == null ? null : json["discount"],
    restaurant: json["restaurant"] == null ? null : RestaurantModel.fromJson(json["restaurant"]),
    notices: json["notices"] == null ? null : List<String>.from(json["notices"].map((x) => x)),
    usersFavorites: json["users_favorites"] == null ? null : List<String>.from(json["users_favorites"].map((x) => x)),
    orders: json["orders"] == null ? null : List<String>.from(json["orders"].map((x) => x)),
    status: json["status"] == null ? null : json["status"],
    id: json["_id"] == null ? null : json["_id"],
    createdAt: json["createdAt"] == null ? null : json["createdAt"],
    updatedAt: json["updatedAt"] == null ? null : json["updatedAt"],
  );

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
}