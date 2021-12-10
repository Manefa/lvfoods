
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ivfoods_mobile_app/core/error/exception.dart';
import 'package:ivfoods_mobile_app/features/take_deliveries/data/models/take_delivery_master_model.dart';
import 'package:ivfoods_mobile_app/features/take_deliveries/domain/entities/take_delivery_master.dart';
import 'package:ivfoods_mobile_app/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class TakeDeliveryRemoteDataSource {
  /// Calls the https://lvfood-site.herokuapp.com/api/deliveries/take/{code} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  ///
  Future<TakeDeliveryMaster> takeDelivery(String code);
}

class TakeDeliveryRemoteDataSourceImpl implements TakeDeliveryRemoteDataSource {
  final http.Client client;
  TakeDeliveryRemoteDataSourceImpl({required this.client});

  @override
  Future<TakeDeliveryMaster> takeDelivery(String code) async {
    final token = sl<SharedPreferences>().getString("token");
    final response = await client.put(
      Uri.parse("https://lvfood-site.herokuapp.com/api/deliveries/take/$code"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'api_key': '9a5c786c-2762-45ab-a781-44dc705c4970',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      var takeDeliveryResponse = TakeDeliveryMasterModel.fromJson(responseJson);
      return takeDeliveryResponse;
    } else {
      throw ServerException();
    }
  }
}


