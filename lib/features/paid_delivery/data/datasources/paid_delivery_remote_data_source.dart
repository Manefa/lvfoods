
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ivfoods_mobile_app/core/error/exception.dart';
import 'package:ivfoods_mobile_app/features/paid_delivery/data/models/paid_delivery_model.dart';
import 'package:ivfoods_mobile_app/features/paid_delivery/domain/entities/paid_delivery_master.dart';
import 'package:ivfoods_mobile_app/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';



abstract class PaidDeliveryRemoteDataSource {
  /// Calls the https://lvfood-site.herokuapp.com/api/deliveries/paid/{code} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  ///
  Future<PaidDeliveryMaster> paidDelivery(String code);
}

class PaidDeliveryRemoteDataSourceImpl implements PaidDeliveryRemoteDataSource {
  final http.Client client;
  PaidDeliveryRemoteDataSourceImpl({required this.client});

  @override
  Future<PaidDeliveryMaster> paidDelivery(String code) async {
    final token = sl<SharedPreferences>().getString("token");
    final response = await client.put(
      Uri.parse("https://lvfood-site.herokuapp.com/api/deliveries/paid/$code"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'api_key': '9a5c786c-2762-45ab-a781-44dc705c4970',
        'Authorization': 'Bearer $token',
      },
    );

    print(response.statusCode);

    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      var paidDeliveryResponse = PaidDeliveryMasterModel.fromJson(responseJson);
      return paidDeliveryResponse;
    } else {
      throw ServerException();
    }
  }
}