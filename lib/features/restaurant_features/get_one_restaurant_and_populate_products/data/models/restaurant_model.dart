import 'package:ivfoods_mobile_app/features/restaurant_features/get_one_restaurant_and_populate_products/data/models/product_model.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_one_restaurant_and_populate_products/domain/entities/restaurant.dart';

class RestaurantModel extends Restaurant{
  RestaurantModel({
    required List<ProductModel>? products,
  }) : super(products: products);

  factory RestaurantModel.fromJson(Map<String, dynamic> json) => RestaurantModel(
    products: json["products"] == null ? null : List<ProductModel>.from(json["products"].map((x) => ProductModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "products": products == null ? null : List<dynamic>.from(products!.map((x) => x.toJson())),
  };

  @override
  List<Object?> get props => [products];
}