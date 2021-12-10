import 'package:ivfoods_mobile_app/features/get_one_for_deliver/data/models/category_model.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/domain/entities/style.dart';

class StyleModel extends Style{

  StyleModel({
    final String? name,
    final String? code,
    final String? description,
    final String? picture,
    final List<String>? restaurants,
    final List<CategoryModel>? categories,
    final String? id,
    final String? createdAt,
    final String? updatedAt,
  }) : super(
    name: name,
    code: code,
    description: description,
    picture: picture,
    restaurants: restaurants,
    categories: categories,
    id: id,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );

  factory StyleModel.fromJson(Map<String, dynamic> json) => StyleModel(
    name: json["name"] == null ? null : json["name"],
    code: json["code"] == null ? null : json["code"],
    description: json["description"] == null ? null : json["description"],
    picture: json["picture"] == null ? null : json["picture"],
    restaurants: json["restaurants"] == null ? null : List<String>.from(json["restaurants"].map((x) => x)),
    categories: json["categories"] == null ? null : List<CategoryModel>.from(json["categories"].map((x) => CategoryModel.fromJson(x))),
    id: json["_id"] == null ? null : json["_id"],
    createdAt: json["createdAt"] == null ? null : json["createdAt"],
    updatedAt: json["updatedAt"] == null ? null : json["updatedAt"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "code": code == null ? null : code,
    "description": description == null ? null : description,
    "picture": picture == null ? null : picture,
    "restaurants": restaurants == null ? null : List<dynamic>.from(restaurants!.map((x) => x)),
    "categories": categories == null ? null : List<dynamic>.from(categories!.map((x) => x.toJson())),
    "_id": id == null ? null : id,
    "createdAt": createdAt == null ? null : createdAt,
    "updatedAt": updatedAt == null ? null : updatedAt,
  };
}