import 'package:ivfoods_mobile_app/features/orders/data/models/category_model.dart';
import 'package:ivfoods_mobile_app/features/orders/domain/entities/style.dart';

class StyleModel extends Style{

  StyleModel({
    required final String? name,
    required final String? code,
    required final String? description,
    required final String? picture,
    required final List<String>? restaurants,
    required final List<CategoryModel>? categories,
    required final String? id,
  }) : super(
    name: name,
    code: code,
    description: description,
    picture: picture,
    restaurants: restaurants,
    categories: categories,
    id: id,
  );

  factory StyleModel.fromJson(Map<String, dynamic> json) => StyleModel(
    name: json["name"],
    code: json["code"],
    description: json["description"],
    picture: json["picture"],
    restaurants: List<String>.from(json["restaurants"].map((x) => x)),
    categories: List<CategoryModel>.from(json["categories"].map((x) => CategoryModel.fromJson(x))),
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "code": code,
    "description": description,
    "picture": picture,
    "restaurants": List<String>.from(restaurants!.map((x) => x)),
    "categories": List<CategoryModel>.from(categories!.map((x) => x.toJson())),
    "_id": id,
  };
}