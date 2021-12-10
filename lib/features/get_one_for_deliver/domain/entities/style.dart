import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/domain/entities/category.dart';

class Style extends Equatable{
  final String? name;
  final String? code;
  final String? description;
  final String? picture;
  final List<String>? restaurants;
  final List<Category>? categories;
  final String? id;
  final String? createdAt;
  final String? updatedAt;

  Style({
    required this.name,
    required this.code,
    required this.description,
    required this.picture,
    required this.restaurants,
    required this.categories,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });

  // factory Style.fromJson(Map<String, dynamic> json) => Style(
  //   name: json["name"] == null ? null : msgValues.map[json["name"]],
  //   code: json["code"] == null ? null : msgValues.map[json["code"]],
  //   description: json["description"] == null ? null : msgValues.map[json["description"]],
  //   picture: json["picture"] == null ? null : msgValues.map[json["picture"]],
  //   restaurants: json["restaurants"] == null ? null : List<Msg>.from(json["restaurants"].map((x) => msgValues.map[x])),
  //   categories: json["categories"] == null ? null : List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
  //   id: json["_id"] == null ? null : msgValues.map[json["_id"]],
  //   createdAt: json["createdAt"] == null ? null : msgValues.map[json["createdAt"]],
  //   updatedAt: json["updatedAt"] == null ? null : msgValues.map[json["updatedAt"]],
  // );

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

  @override
  List<Object?> get props => [name, code, description, picture, restaurants, categories, id, createdAt, updatedAt];
}