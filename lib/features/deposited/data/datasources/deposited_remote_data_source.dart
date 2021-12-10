import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ivfoods_mobile_app/core/error/exception.dart';
import 'package:ivfoods_mobile_app/features/deposited/data/models/deposited_model.dart';
import 'package:ivfoods_mobile_app/features/deposited/domain/entities/deposited.dart';
import 'package:ivfoods_mobile_app/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class DepositedRemoteDataSource {
  /// Calls the https://lvfood-site.herokuapp.com/api/orders/deposited/{code} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  ///
  Future<Deposited> updateStatusOrder(String code);
}

class DepositedRemoteDataSourceImpl implements DepositedRemoteDataSource {
  final http.Client client;
  DepositedRemoteDataSourceImpl({required this.client});

  @override
  Future<Deposited> updateStatusOrder(String code) async {
    final token = sl<SharedPreferences>().getString("token");
    final response = await client.put(
      Uri.parse("https://lvfood-site.herokuapp.com/api/orders/deposited/$code"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'api_key': '9a5c786c-2762-45ab-a781-44dc705c4970',
        'Authorization': 'Bearer $token',
      },
    );

    if(response.statusCode == 400){
      print("400");
    }

    if(response.statusCode == 401){
      print("401");
    }

    if(response.statusCode == 403){
      print("403");
    }

    if(response.statusCode == 404){
      print("404");
    }

    if(response.statusCode == 500){
      print("500");
    }

    if (response.statusCode == 200) {
      print(response.statusCode.toString());
      var responseJson = jsonDecode(response.body);
      var depositedResponse = DepositedModel.fromJson(responseJson);
      return depositedResponse;
    } else {
      throw ServerException();
    }
  }
}


