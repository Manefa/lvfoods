import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/domain/entities/product.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/domain/entities/restaurant.dart';

class Favorites extends Equatable{
  final List<Restaurant>? restaurants;
  final List<Product>? products;

  Favorites({
    required this.restaurants,
    required this.products,
  });

  // factory Favorites.fromJson(Map<String, dynamic> json) => Favorites(
  //   restaurants: json["restaurants"] == null ? null : List<Restaurant>.from(json["restaurants"].map((x) => Restaurant.fromJson(x))),
  //   products: json["products"] == null ? null : List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
  // );

  Map<String, dynamic> toJson() => {
    "restaurants": restaurants == null ? null : List<dynamic>.from(restaurants!.map((x) => x.toJson())),
    "products": products == null ? null : List<dynamic>.from(products!.map((x) => x.toJson())),
  };

  @override
  List<Object?> get props => [restaurants, products];
}