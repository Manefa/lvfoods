import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_categories/domain/entities/category.dart';

class GetCategoriesMaster extends Equatable{
  final bool? success;
  final List<Category>? categories;

  GetCategoriesMaster({
    required this.success,
    required this.categories,
  });


  // factory GetMealCategories.fromJson(Map<String, dynamic> json) => GetMealCategories(
  //   success: json["success"] == null ? null : json["success"],
  //   categories: json["categories"] == null ? null : List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
  // );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "categories": categories == null ? null : List<dynamic>.from(categories!.map((x) => x.toJson())),
  };

  @override
  List<Object?> get props => [success, categories];
}