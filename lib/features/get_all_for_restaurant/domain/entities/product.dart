import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/domain/entities/category.dart';

class Product extends Equatable{
  final String? name;
  final String? description;
  final String? picture;
  final String? code;
  final int? price;
  final double? note;
  final int? discount;
  final List<String>? notices;
  final List<String>? categories;
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
    "notices": List<String>.from(notices!.map((x) => x)),
    "categories": List<String>.from(categories!.map((x) => x)),
    "users_favorites": List<String>.from(usersFavorites!.map((x) => x)),
    "orders": List<dynamic>.from(orders!.map((x) => x)),
    "status": status,
    "_id": id,
  };

  @override
  List<Object?> get props => [name, description, picture, code, price, note, discount, notices,
  categories, usersFavorites, orders, status, id];
}