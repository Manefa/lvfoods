import 'package:ivfoods_mobile_app/features/orders/data/models/category_model.dart';
import 'package:ivfoods_mobile_app/features/orders/domain/entities/product.dart';

class ProductModel extends Product{
  ProductModel({
    required final String? name,
    required final String? description,
    required final String? picture,
    required final String? code,
    required final int? price,
    required final int? note,
    required final int? discount,
    required final String? restaurant,
    required final List<String>? notices,
    required final List<CategoryModel>? categories,
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
    restaurant: restaurant,
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
    note: json["note"],
    discount: json["discount"],
    restaurant: json["restaurant"],
    notices: List<String>.from(json["notices"].map((x) => x)),
    categories: List<CategoryModel>.from(json["categories"].map((x) => CategoryModel.fromJson(x))),
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
    "restaurant": restaurant,
    "notices": List<String>.from(notices!.map((x) => x)),
    "categories": List<CategoryModel>.from(categories!.map((x) => x.toJson())),
    "users_favorites": List<String>.from(usersFavorites!.map((x) => x)),
    "orders": List<String>.from(orders!.map((x) => x)),
    "status": status,
    "_id": id,
  };
}