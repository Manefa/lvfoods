
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/data/models/product_model.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/data/models/restaurant_model.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/domain/entities/favorites.dart';

class FavoritesModel extends Favorites{
  FavoritesModel({
    required final List<RestaurantModel>? restaurants,
    required final List<ProductModel>? products,
  }) : super(
    restaurants: restaurants,
    products: products,
  );

  factory FavoritesModel.fromJson(Map<String, dynamic> json) => FavoritesModel(
    restaurants: json["restaurants"] == null ? null : List<RestaurantModel>.from(json["restaurants"].map((x) => RestaurantModel.fromJson(x))),
    products: json["products"] == null ? null : List<ProductModel>.from(json["products"].map((x) => ProductModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "restaurants": restaurants == null ? null : List<dynamic>.from(restaurants!.map((x) => x.toJson())),
    "products": products == null ? null : List<dynamic>.from(products!.map((x) => x.toJson())),
  };
}