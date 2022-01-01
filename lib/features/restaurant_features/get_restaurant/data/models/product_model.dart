
import 'package:ivfoods_mobile_app/features/restaurant_features/get_restaurant/domain/entities/product.dart';

class ProductModel extends Product{
  ProductModel({
    required final String? name,
  }) : super(
    name: name,
  );


  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}