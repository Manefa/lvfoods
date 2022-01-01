
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ivfoods_mobile_app/core/error/exception.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/remove_hours/data/models/remove_hours_model.dart';
import 'package:ivfoods_mobile_app/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';


abstract class RemoveHoursRemoteDataSource{

  /// Calls the https://lvfood-site.herokuapp.com/api/restaurants/{name}/hour/remove/{hour} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<RemoveHoursModel> removeHours(String hours,  String name);
}

class RemoveHoursRemoteDataSourceImpl implements RemoveHoursRemoteDataSource {
  final http.Client client;

  RemoveHoursRemoteDataSourceImpl({required this.client});

  @override
  Future<RemoveHoursModel> removeHours(String hours, String name) async {
    final token = sl<SharedPreferences>().getString("token");
    //final tokenPrime =  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb2RlIjoiVVNSLUw1TEhQVyIsImlhdCI6MTYzNTk0NDg0MCwiZXhwIjoyMjQwNzQ0ODQwfQ.5jeM4ZUKyllozNy69t3og2RgEKm2IpS4GBo0cZNeAak";
    final response = await client.put(
      Uri.parse("https://lvfood-site.herokuapp.com/api/restaurants/$name/hour/remove/$hours"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'api_key': '9a5c786c-2762-45ab-a781-44dc705c4970',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return RemoveHoursModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}