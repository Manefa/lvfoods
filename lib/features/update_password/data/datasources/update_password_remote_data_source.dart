
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ivfoods_mobile_app/core/error/exception.dart';
import 'package:ivfoods_mobile_app/features/update_password/data/models/update_password_master_model.dart';
import 'package:ivfoods_mobile_app/features/update_password/domain/entities/send_password.dart';
import 'package:ivfoods_mobile_app/features/update_password/domain/entities/update_password_master.dart';
import 'package:ivfoods_mobile_app/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UpdatePasswordRemoteDataSource {
  /// Calls the https://lvfood-site.herokuapp.com/api/users/update/password endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  ///
  Future<UpdatePasswordMaster> updatePassword(SendPassword sendPassword);
}

class UpdatePasswordRemoteDataSourceImpl implements UpdatePasswordRemoteDataSource {
  final http.Client client;
  UpdatePasswordRemoteDataSourceImpl({required this.client});

  @override
  Future<UpdatePasswordMaster> updatePassword(SendPassword sendPassword) async {
    final token = sl<SharedPreferences>().getString("token");
    final body = jsonEncode(
        {
          "last_password": sendPassword.lastPassword,
          "new_password": sendPassword.newPassword,
          "confirm_password": sendPassword.confirmPassword
        }
    );
    final response = await client.put(
      Uri.parse("https://lvfood-site.herokuapp.com/api/users/update/password"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'api_key': '9a5c786c-2762-45ab-a781-44dc705c4970',
        'Authorization': 'Bearer $token',
      },
      body: body,
    );

    print(response.statusCode.toString() + "ouiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii");
    print(response.body.toString() + "ffffffffffffffffffffffffffffffffffffffffffffffffff");

    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      var takeDeliveryResponse = UpdatePasswordMasterModel.fromJson(responseJson);
      return takeDeliveryResponse;
    } else {
      throw ServerException();
    }
  }
}


