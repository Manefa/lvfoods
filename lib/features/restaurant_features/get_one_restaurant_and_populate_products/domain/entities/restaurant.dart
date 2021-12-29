import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_one_restaurant_and_populate_products/domain/entities/product.dart';

class Restaurant extends Equatable{
  final List<Product>? products;

  Restaurant({
    required this.products,
  });

  // factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
  //   products: json["products"] == null ? null : List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
  // );

  Map<String, dynamic> toJson() => {
    "products": products == null ? null : List<dynamic>.from(products!.map((x) => x.toJson())),
  };

  @override
  List<Object?> get props => [products];
}