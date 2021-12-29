
import 'dart:convert';

import 'package:ivfoods_mobile_app/core/error/exception.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_product_details/data/models/get_produit_details_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class GetProductDetailsLocalDataSource {
  /// Gets the cached [GetProductDetailsModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [NoLocalDataException] if no cached data is present.
  Future<GetProductDetailsModel> getProductDetails(String code);

  Future<void> cacheProductDetails(GetProductDetailsModel productDetailsToCache, String code);
}


class GetProductDetailsLocalDataSourceImpl implements GetProductDetailsLocalDataSource {
  final SharedPreferences sharedPreferences;

  GetProductDetailsLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<GetProductDetailsModel> getProductDetails(String code) {
    final jsonString = sharedPreferences.getString(code);
    if (jsonString != null) {
      return Future.value(GetProductDetailsModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheProductDetails(GetProductDetailsModel productDetailsToCache, String code) {
    return sharedPreferences.setString(
      code,
      json.encode(productDetailsToCache.toJson()),
    );
  }
}