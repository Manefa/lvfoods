import 'package:ivfoods_mobile_app/features/restaurant_features/get_categories/data/models/category_model.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_categories/domain/entities/get_categories_master.dart';

class GetCategoriesMasterModel extends GetCategoriesMaster{

  GetCategoriesMasterModel({
    required bool? success,
    required List<CategoryModel>? categories,
  }) : super(
    success: success,
    categories: categories,
  );

  factory GetCategoriesMasterModel.fromJson(Map<String, dynamic> json) => GetCategoriesMasterModel(
    success: json["success"] == null ? null : json["success"],
    categories: json["categories"] == null ? null : List<CategoryModel>.from(json["categories"].map((x) => CategoryModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "categories": categories == null ? null : List<dynamic>.from(categories!.map((x) => x.toJson())),
  };

  @override
  List<Object?> get props => [success, categories];
}