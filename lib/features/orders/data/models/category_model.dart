import 'package:ivfoods_mobile_app/features/orders/domain/entities/category.dart';

class CategoryModel extends Category{
  CategoryModel({
    required final String? name,
    required final String? code,
    required final String? picture,
    required final List<String>? styles,
    required final List<String>? products,
    required final String? id,
  }) : super(
    name: name,
    code: code,
    picture: picture,
    styles: styles,
    products: products,
    id: id,
  );

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    name: json["name"],
    code: json["code"],
    picture: json["picture"],
    styles: List<String>.from(json["styles"].map((x) => x)),
    products: List<String>.from(json["products"].map((x) => x)),
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "code": code,
    "picture": picture,
    "styles": List<String>.from(styles!.map((x) => x)),
    "products": List<String>.from(products!.map((x) => x)),
    "_id": id,
  };
}