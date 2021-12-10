import 'package:ivfoods_mobile_app/features/deliveries/domain/entities/product.dart';

class ProductModel extends Product{

  ProductModel({
    required String? name,
  }) : super(
    name: name,
  );

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
  };
}