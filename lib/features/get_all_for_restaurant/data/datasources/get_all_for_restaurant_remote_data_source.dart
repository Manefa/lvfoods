import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ivfoods_mobile_app/core/error/exception.dart';
import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/data/models/get_all_for_restaurant_model.dart';
import 'package:ivfoods_mobile_app/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class GetAllForRestaurantRemoteDataSource {

  /// Calls the https://lvfood-site.herokuapp.com/api/orders/getAllForRestaurant/{name} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<GetAllForRestaurantModel> getAllForRestaurant(String restaurantName);
}

class GetAllForRestaurantRemoteDataSourceImpl implements GetAllForRestaurantRemoteDataSource {
  final http.Client client;

  GetAllForRestaurantRemoteDataSourceImpl({required this.client});

  @override
  Future<GetAllForRestaurantModel> getAllForRestaurant(String restaurantName) async {
    final token = sl<SharedPreferences>().getString("token");
    //final tokenPrime =  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb2RlIjoiVVNSLUw1TEhQVyIsImlhdCI6MTYzNTk0NDg0MCwiZXhwIjoyMjQwNzQ0ODQwfQ.5jeM4ZUKyllozNy69t3og2RgEKm2IpS4GBo0cZNeAak";
    final response = await client.get(
      Uri.parse("https://lvfood-site.herokuapp.com/api/orders/getAllForRestaurant/$restaurantName"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'api_key': '9a5c786c-2762-45ab-a781-44dc705c4970',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      print(response.body);
      return GetAllForRestaurantModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}