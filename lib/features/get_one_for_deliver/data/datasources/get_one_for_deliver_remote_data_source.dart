
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ivfoods_mobile_app/core/error/exception.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/data/models/get_one_for_deliver.dart';
import 'package:ivfoods_mobile_app/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';


abstract class GetOneForDeliverRemoteDataSource {

  /// Calls the https://lvfood-site.herokuapp.com/api/deliveries/getOneForDeliver/{code} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<GetOneForDeliverModel> getOneForDeliver(String code);
}

class GetOneForDeliverRemoteDataSourceImpl implements GetOneForDeliverRemoteDataSource {
  final http.Client client;

  GetOneForDeliverRemoteDataSourceImpl({required this.client});

  @override
  Future<GetOneForDeliverModel> getOneForDeliver(String code) async {
    final token = sl<SharedPreferences>().getString("token");
    //final tokenPrime =  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb2RlIjoiVVNSLUw1TEhQVyIsImlhdCI6MTYzNTk0NDg0MCwiZXhwIjoyMjQwNzQ0ODQwfQ.5jeM4ZUKyllozNy69t3og2RgEKm2IpS4GBo0cZNeAak";
    final response = await client.get(
      Uri.parse("https://lvfood-site.herokuapp.com/api/deliveries/getOneForDeliver/$code"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'api_key': '9a5c786c-2762-45ab-a781-44dc705c4970',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      print(response.body);
      return GetOneForDeliverModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}