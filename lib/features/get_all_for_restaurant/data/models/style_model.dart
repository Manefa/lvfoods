import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/domain/entities/style.dart';

class StyleModel extends Style{
  StyleModel({
    required final String? name,
    required final String? code,
    required final String? description,
    required final String? picture,
    required final List<String>? restaurants,
    required final List<String>? categories,
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
    categories: List<String>.from(json["categories"].map((x) => x)),
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "code": code,
    "description": description,
    "picture": picture,
    "restaurants": List<String>.from(restaurants!.map((x) => x)),
    "categories": List<String>.from(categories!.map((x) => x)),
    "_id": id,
  };
}