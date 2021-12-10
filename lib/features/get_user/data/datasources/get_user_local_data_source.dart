import 'dart:convert';

import 'package:ivfoods_mobile_app/core/error/exception.dart';
import 'package:ivfoods_mobile_app/features/get_user/data/models/user_master_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class GetUserLocalDataSource {
  /// Gets the cached [UserMasterModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [NoLocalDataException] if no cached data is present.
  Future<UserMasterModel> getCacheUser();

  Future<void> cacheUser(UserMasterModel userToCache);
}

const CACHED_DELIVERIES = 'CACHED_USER';

class GetUserLocalDataSourceImpl implements GetUserLocalDataSource {
  final SharedPreferences sharedPreferences;

  GetUserLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<UserMasterModel> getCacheUser() {
    final jsonString = sharedPreferences.getString('CACHED_USER');
    if (jsonString != null) {
      return Future.value(UserMasterModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheUser(UserMasterModel userToCache) {
    return sharedPreferences.setString(
      CACHED_DELIVERIES,
      json.encode(userToCache.toJson()),
    );
  }
}