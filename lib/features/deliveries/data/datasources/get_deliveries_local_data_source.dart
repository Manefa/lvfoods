import 'dart:convert';
import 'package:ivfoods_mobile_app/core/error/exception.dart';
import 'package:ivfoods_mobile_app/features/deliveries/data/models/deliveries_masters_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class GetDeliveriesLocalDataSource {
  /// Gets the cached [DeliveriesMastersModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [NoLocalDataException] if no cached data is present.
  Future<DeliveriesMastersModel> getLastDeliveries();

  Future<void> cacheDeliveries(DeliveriesMastersModel deliveriesToCache);
}

const CACHED_DELIVERIES = 'CACHED_DELIVERIES';

class GetDeliveriesLocalDataSourceImpl implements GetDeliveriesLocalDataSource {
  final SharedPreferences sharedPreferences;

  GetDeliveriesLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<DeliveriesMastersModel> getLastDeliveries() {
    final jsonString = sharedPreferences.getString('CACHED_DELIVERIES');
    if (jsonString != null) {
      return Future.value(DeliveriesMastersModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheDeliveries(DeliveriesMastersModel deliveriesToCache) {
    return sharedPreferences.setString(
      CACHED_DELIVERIES,
      json.encode(deliveriesToCache.toJson()),
    );
  }
}