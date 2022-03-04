
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ivfoods_mobile_app/core/error/exception.dart';
import 'package:ivfoods_mobile_app/features/paid_order_group/data/models/order_group_paid_model.dart';
import 'package:ivfoods_mobile_app/features/paid_order_group/domain/entities/order_group_paid.dart';
import 'package:ivfoods_mobile_app/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';


abstract class OrderGroupPaidRemoteDataSource {
  /// Calls the https://lvfood-site.herokuapp.com/api/orders-groups/paid/{code} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  ///
  Future<OrderGroupPaid> paidOrderGroup(String code);
}

class OrderGroupPaidRemoteDataSourceImpl implements OrderGroupPaidRemoteDataSource {
  final http.Client client;
  OrderGroupPaidRemoteDataSourceImpl({required this.client});

  @override
  Future<OrderGroupPaid> paidOrderGroup(String code) async {
    final token = sl<SharedPreferences>().getString("token");
    final response = await client.put(
      Uri.parse("https://lvfood-site.herokuapp.com/api/orders-groups/paid/$code"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'api_key': '9a5c786c-2762-45ab-a781-44dc705c4970',
        'Authorization': 'Bearer $token',
      },
    );

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      var paidDeliveryResponse = OrderGroupPaidModel.fromJson(responseJson);
      return paidDeliveryResponse;
    } else {
      throw ServerException();
    }
  }
}