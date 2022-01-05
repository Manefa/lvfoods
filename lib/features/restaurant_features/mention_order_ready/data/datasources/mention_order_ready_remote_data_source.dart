
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ivfoods_mobile_app/core/error/exception.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/mention_order_ready/data/models/mention_order_ready_model.dart';
import 'package:ivfoods_mobile_app/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class MentionOrderReadyRemoteDataSource {
  /// Calls the https://lvfood-site.herokuapp.com/api/orders/ready/{code} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  ///
  Future<MentionOrderReadyModel> mentionOrderReady(String code);
}

class MentionOrderReadyRemoteDataSourceImpl implements MentionOrderReadyRemoteDataSource {
  final http.Client client;
  MentionOrderReadyRemoteDataSourceImpl({required this.client});

  @override
  Future<MentionOrderReadyModel> mentionOrderReady(String code) async {
    final token = sl<SharedPreferences>().getString("token");
    final response = await client.put(
      Uri.parse("https://lvfood-site.herokuapp.com/api/orders/ready/$code"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'api_key': '9a5c786c-2762-45ab-a781-44dc705c4970',
        'Authorization': 'Bearer $token',
      },
     );

    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      var startRecoveryResponse = MentionOrderReadyModel.fromJson(responseJson);
      return startRecoveryResponse;
    } else {
      throw ServerException();
    }
  }
}


