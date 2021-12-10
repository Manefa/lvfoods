import 'package:ivfoods_mobile_app/features/orders/data/models/product_model.dart';
import 'package:ivfoods_mobile_app/features/orders/domain/entities/favorites.dart';

class FavoritesModel extends Favorites{
  FavoritesModel({
    required final List<String>? restaurants,
    required final List<ProductModel>? products,
  }) : super(
    restaurants: restaurants,
    products: products,
  );

  factory FavoritesModel.fromJson(Map<String, dynamic> json) => FavoritesModel(
    restaurants: List<String>.from(json["restaurants"].map((x) => x)),
    products: List<ProductModel>.from(json["products"].map((x) => ProductModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "restaurants": List<dynamic>.from(restaurants!.map((x) => x)),
    "products": List<dynamic>.from(products!.map((x) => x.toJson())),
  };
}