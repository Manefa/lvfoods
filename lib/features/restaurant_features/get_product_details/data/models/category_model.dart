
import 'package:ivfoods_mobile_app/features/restaurant_features/get_product_details/domain/entities/category.dart';

class CategoryModel extends Category{
  final String? name;

  CategoryModel({
    required this.name,
  }) : super(
    name: name
  );

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
  };

  @override
  List<Object?> get props => [name];
}