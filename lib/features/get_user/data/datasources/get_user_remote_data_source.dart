import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ivfoods_mobile_app/core/error/exception.dart';
import 'package:ivfoods_mobile_app/features/get_user/data/models/user_master_model.dart';
import 'package:ivfoods_mobile_app/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class GetUserRemoteDataSource {

  /// Calls the http://lvfood-site.herokuapp.com/api/users/get_users_getProfile endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<UserMasterModel> getUser();
}

class GetUserRemoteDataSourceImpl implements GetUserRemoteDataSource {
  final http.Client client;

  GetUserRemoteDataSourceImpl({required this.client});

  @override
  Future<UserMasterModel> getUser() async {
    final token = sl<SharedPreferences>().getString("token");
    final response = await client.get(
      Uri.parse("https://lvfood-site.herokuapp.com/api/users/getProfile"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'api_key': '9a5c786c-2762-45ab-a781-44dc705c4970',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      print(response.body);
      return UserMasterModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}