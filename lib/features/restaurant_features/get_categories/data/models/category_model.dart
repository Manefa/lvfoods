
import 'package:ivfoods_mobile_app/features/restaurant_features/get_categories/domain/entities/category.dart';

class CategoryModel extends Category{
  CategoryModel({
    required String? id,
    required String? name,
  }) : super(
    id: id,
    name: name,
  );

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    id: json["_id"] == null ? null : json["_id"],
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id == null ? null : id,
    "name": name == null ? null : name,
  };
}