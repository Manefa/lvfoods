import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/orders/domain/entities/category.dart';

class Product extends Equatable{
  final String? name;
  final String? description;
  final String? picture;
  final String? code;
  final int? price;
  final int? note;
  final int? discount;
  final String? restaurant;
  final List<String>? notices;
  final List<Category>? categories;
  final List<String>? usersFavorites;
  final List<String>? orders;
  final String? status;
  final String? id;


  Product({
    required final this.name,
    required final this.description,
    required final this.picture,
    required final this.code,
    required final this.price,
    required final this.note,
    required final this.discount,
    required final this.restaurant,
    required final this.notices,
    required final this.categories,
    required final this.usersFavorites,
    required final this.orders,
    required final this.status,
    required final this.id,
  });


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
    "categories": List<Category>.from(categories!.map((x) => x.toJson())),
    "users_favorites": List<String>.from(usersFavorites!.map((x) => x)),
    "orders": List<String>.from(orders!.map((x) => x)),
    "status": status,
    "_id": id,
  };

  @override
  List<Object?> get props => [name, description, picture, code, price, note, discount, restaurant, notices,
  categories, usersFavorites, orders, status, id];
}