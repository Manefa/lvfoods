import 'dart:convert';

import 'package:ivfoods_mobile_app/core/error/exception.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_one_restaurant_and_populate_products/data/models/get_one_restaurant_and_populate_products_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class GetOneRestaurantAndPopulateProductsLocalDataSource {
  /// Gets the cached [GetOneRestaurantAndPopulateProductsModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [NoLocalDataException] if no cached data is present.
  Future<GetOneRestaurantAndPopulateProductsModel> getProducts();

  Future<void> cacheProducts(GetOneRestaurantAndPopulateProductsModel productsToCache);
}

const CACHED_PRODUCTS = 'CACHED_PRODUCTS';

class GetOneRestaurantAndPopulateProductsLocalDataSourceImpl implements GetOneRestaurantAndPopulateProductsLocalDataSource {
  final SharedPreferences sharedPreferences;

  GetOneRestaurantAndPopulateProductsLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<GetOneRestaurantAndPopulateProductsModel> getProducts() {
    final jsonString = sharedPreferences.getString('CACHED_PRODUCTS');
    if (jsonString != null) {
      return Future.value(GetOneRestaurantAndPopulateProductsModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheProducts(GetOneRestaurantAndPopulateProductsModel productsToCache) {
    return sharedPreferences.setString(
      CACHED_PRODUCTS,
      json.encode(productsToCache.toJson()),
    );
  }
}