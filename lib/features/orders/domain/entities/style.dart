import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/orders/domain/entities/category.dart';

class Style extends Equatable{

  final String? name;
  final String? code;
  final String? description;
  final String? picture;
  final List<String>? restaurants;
  final List<Category>? categories;
  final String? id;

  Style({
    required final this.name,
    required final this.code,
    required final this.description,
    required final this.picture,
    required final this.restaurants,
    required final this.categories,
    required final this.id,
  });

  Map<String, dynamic> toJson() => {
    "name": name,
    "code": code,
    "description": description,
    "picture": picture,
    "restaurants": List<String>.from(restaurants!.map((x) => x)),
    "categories": List<Category>.from(categories!.map((x) => x.toJson())),
    "_id": id,
  };

  @override
  List<Object?> get props => [name, code, description, picture, restaurants, categories, id];
}