import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/data/models/style_model.dart';
import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/domain/entities/category.dart';

class CategoryModel extends Category{
  CategoryModel({
    required final String? name,
    required final String? code,
    required final String? picture,
    required final List<StyleModel>? styles,
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
    styles: List<StyleModel>.from(json["styles"].map((x) => StyleModel.fromJson(x))),
    products: List<String>.from(json["products"].map((x) => x)),
    id: json["_id"],
  );

}