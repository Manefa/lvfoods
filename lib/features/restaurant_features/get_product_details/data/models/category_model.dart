
import 'package:ivfoods_mobile_app/features/restaurant_features/get_product_details/domain/entities/categorys.dart';

class CategoryModel extends Categorys{
  CategoryModel({
    required String? name,
    required String id,
  }) : super(
    name: name,
    id: id,
  );

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    name: json["name"] == null ? null : json["name"],
    id: json["_id"] == null ? null : json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "_id": id == null ? null : id,
  };

  @override
  List<Object?> get props => [name, id];
}