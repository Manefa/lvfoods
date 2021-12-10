import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ivfoods_mobile_app/core/error/exception.dart';
import 'package:ivfoods_mobile_app/features/start_recovery/data/models/start_recovery_model.dart';
import 'package:ivfoods_mobile_app/features/start_recovery/domain/entities/start_recovery.dart';
import 'package:ivfoods_mobile_app/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class StartRecoveryRemoteDataSource {
  /// Calls the https://lvfood-site.herokuapp.com/api/orders/start-recovery/{code} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  ///
  Future<StartRecovery> updateStatusOrder(String code);
}

class StartRecoveryRemoteDataSourceImpl implements StartRecoveryRemoteDataSource {
  final http.Client client;
  StartRecoveryRemoteDataSourceImpl({required this.client});

  @override
  Future<StartRecovery> updateStatusOrder(String code) async {
    final token = sl<SharedPreferences>().getString("token");
    final response = await client.put(
      Uri.parse("https://lvfood-site.herokuapp.com/api/orders/start-recovery/$code"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'api_key': '9a5c786c-2762-45ab-a781-44dc705c4970',
        'Authorization': 'Bearer $token',
      },
     );

    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      var startRecoveryResponse = StartRecoveryModel.fromJson(responseJson);
      return startRecoveryResponse;
    } else {
      throw ServerException();
    }
  }
}


