import 'package:ivfoods_mobile_app/features/get_one_for_deliver/domain/entities/category.dart';

class CategoryModel extends Category{
  CategoryModel({
    required final String? name,
    required final String? code,
    required final String? picture,
    required final List<String>? styles,
    required final List<String>? products,
    required final String id,
    required final createdAt,
    required final updatedAt,
  }) : super(
    name: name,
    code: code,
    picture: picture,
    styles: styles,
    products: products,
    id: id,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    name: json["name"] == null ? null : json["name"],
    code: json["code"] == null ? null : json["code"],
    picture: json["picture"] == null ? null : json["picture"],
    styles: json["styles"] == null ? null : List<String>.from(json["styles"].map((x) => x)),
    products: json["products"] == null ? null : List<String>.from(json["products"].map((x) => x)),
    id: json["_id"] == null ? null : json["_id"],
    createdAt: json["createdAt"] == null ? null : json["createdAt"],
    updatedAt: json["updatedAt"] == null ? null : json["updatedAt"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "code": code == null ? null : code,
    "picture": picture == null ? null : picture,
    "styles": styles == null ? null : List<dynamic>.from(styles!.map((x) => x)),
    "products": products == null ? null : List<dynamic>.from(products!.map((x) => x)),
    "_id": id == null ? null : id,
    "createdAt": createdAt == null ? null : createdAt,
    "updatedAt": updatedAt == null ? null : updatedAt,
  };
}