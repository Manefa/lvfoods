import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ivfoods_mobile_app/core/error/exception.dart';
import 'package:ivfoods_mobile_app/features/start_deposition/data/models/start_deposition_model.dart';
import 'package:ivfoods_mobile_app/features/start_deposition/domain/entities/start_deposition.dart';
import 'package:ivfoods_mobile_app/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class StartDepositionRemoteDataSource {
  /// Calls the https://lvfood-site.herokuapp.com/api/orders/start-deposition/{code} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  ///
  Future<StartDeposition> updateStatusOrder(String code);
}

class StartDepositionRemoteDataSourceImpl implements StartDepositionRemoteDataSource {
  final http.Client client;
  StartDepositionRemoteDataSourceImpl({required this.client});

  @override
  Future<StartDeposition> updateStatusOrder(String code) async {
    final token = sl<SharedPreferences>().getString("token");
    final response = await client.put(
      Uri.parse("https://lvfood-site.herokuapp.com/api/orders/start-deposition/$code"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'api_key': '9a5c786c-2762-45ab-a781-44dc705c4970',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      var startDepositionResponse = StartDepositionModel.fromJson(responseJson);
      return startDepositionResponse;
    } else {
      throw ServerException();
    }
  }
}


