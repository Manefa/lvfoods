
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ivfoods_mobile_app/core/error/exception.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_all_restaurants_for_current_user/data/models/get_all_restaurants_for_current_user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../injection_container.dart';


abstract class GetAllRestaurantsForCurrentUserRemoteDataSource {

  /// Calls the https://lvfood-site.herokuapp.com/api/restaurants/getAllForUser endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<GetAllRestaurantsForCurrentUserModel> getAllRestaurantsForCurrentUser();
}

class GetAllRestaurantsForCurrentUserRemoteDataSourceImpl implements GetAllRestaurantsForCurrentUserRemoteDataSource {
  final http.Client client;

  GetAllRestaurantsForCurrentUserRemoteDataSourceImpl({required this.client});

  @override
  Future<GetAllRestaurantsForCurrentUserModel> getAllRestaurantsForCurrentUser() async {
    final token = sl<SharedPreferences>().getString("token");
    //final tokenPrime =  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb2RlIjoiVVNSLUw1TEhQVyIsImlhdCI6MTYzNTk0NDg0MCwiZXhwIjoyMjQwNzQ0ODQwfQ.5jeM4ZUKyllozNy69t3og2RgEKm2IpS4GBo0cZNeAak";
    final response = await client.get(
      Uri.parse("https://lvfood-site.herokuapp.com/api/restaurants/getAllForUser"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'api_key': '9a5c786c-2762-45ab-a781-44dc705c4970',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return GetAllRestaurantsForCurrentUserModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}