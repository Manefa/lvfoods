
import 'dart:convert';

import 'package:ivfoods_mobile_app/core/error/exception.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_all_restaurants_for_current_user/data/models/get_all_restaurants_for_current_user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class GetAllRestaurantsForCurrentUserLocalDataSource {
  /// Gets the cached [GetAllRestaurantsForCurrentUserModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [NoLocalDataException] if no cached data is present.
  Future<GetAllRestaurantsForCurrentUserModel> getLastRestaurants();

  Future<void> cacheRestaurants(GetAllRestaurantsForCurrentUserModel restaurantsToCache);
}

const CACHED_RESTAURANTS = 'CACHED_RESTAURANTS';

class GetAllRestaurantsForCurrentUserLocalDataSourceImpl implements GetAllRestaurantsForCurrentUserLocalDataSource {
  final SharedPreferences sharedPreferences;

  GetAllRestaurantsForCurrentUserLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<GetAllRestaurantsForCurrentUserModel> getLastRestaurants() {
    final jsonString = sharedPreferences.getString('CACHED_RESTAURANTS');
    if (jsonString != null) {
      return Future.value(GetAllRestaurantsForCurrentUserModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheRestaurants(GetAllRestaurantsForCurrentUserModel restaurantsToCache) {
    return sharedPreferences.setString(
      CACHED_RESTAURANTS,
      json.encode(restaurantsToCache.toJson()),
    );
  }
}