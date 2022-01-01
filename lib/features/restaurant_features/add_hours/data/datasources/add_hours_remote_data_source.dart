
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ivfoods_mobile_app/core/error/exception.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_hours/data/models/add_hours_model.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_hours/domain/entities/for_add_hours.dart';
import 'package:ivfoods_mobile_app/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AddHoursRemoteDataSource{

  /// Calls the https://lvfood-site.herokuapp.com/api/restaurants/{name}/hour/add endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<AddHoursModel> addHours(ForAddHours addHours,  String name);
}

class AddHoursRemoteDataSourceImpl implements AddHoursRemoteDataSource {
  final http.Client client;

  AddHoursRemoteDataSourceImpl({required this.client});

  @override
  Future<AddHoursModel> addHours(ForAddHours addHours, String name) async {
    final token = sl<SharedPreferences>().getString("token");
    //final tokenPrime =  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb2RlIjoiVVNSLUw1TEhQVyIsImlhdCI6MTYzNTk0NDg0MCwiZXhwIjoyMjQwNzQ0ODQwfQ.5jeM4ZUKyllozNy69t3og2RgEKm2IpS4GBo0cZNeAak";
    final response = await client.put(
      Uri.parse("https://lvfood-site.herokuapp.com/api/restaurants/$name/hour/add"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'api_key': '9a5c786c-2762-45ab-a781-44dc705c4970',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, dynamic>{
          "day": addHours.day,
          "open": addHours.open,
        "close": addHours.close,
      }),
    );

    if (response.statusCode == 200) {
      return AddHoursModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}