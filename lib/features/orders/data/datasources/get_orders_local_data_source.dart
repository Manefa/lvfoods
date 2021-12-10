import 'dart:convert';
import 'package:ivfoods_mobile_app/core/error/exception.dart';
import 'package:ivfoods_mobile_app/features/orders/data/models/orders_masters_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class GetOrdersLocalDataSource {
  /// Gets the cached [OrdersMastersModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [NoLocalDataException] if no cached data is present.
  Future<OrdersMastersModel> getLastOrders();

  Future<void> cacheOrders(OrdersMastersModel ordersToCache);
}

const CACHED_ORDERS = 'CACHED_ORDERS';

class GetOrdersLocalDataSourceImpl implements GetOrdersLocalDataSource {
  final SharedPreferences sharedPreferences;

  GetOrdersLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<OrdersMastersModel> getLastOrders() {
    final jsonString = sharedPreferences.getString('CACHED_ORDERS');
    if (jsonString != null) {
      return Future.value(OrdersMastersModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheOrders(OrdersMastersModel ordersToCache) {
    return sharedPreferences.setString(
      CACHED_ORDERS,
      json.encode(ordersToCache.toJson()),
    );
  }
}