

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ivfoods_mobile_app/core/error/exception.dart';
import 'package:ivfoods_mobile_app/features/update_users/data/models/user_master_model.dart';
import 'package:ivfoods_mobile_app/features/update_users/domain/entities/user_for_update.dart';
import 'package:ivfoods_mobile_app/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UpdateUserRemoteDataSource {

  /// Calls the http://lvfood-site.herokuapp.com/api/users/update endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<UserMasterModel> updateUser(UserForUpdate user);
}

class UpdateUserRemoteDataSourceImpl implements UpdateUserRemoteDataSource {
  final Dio dio;

  UpdateUserRemoteDataSourceImpl({required this.dio});

  @override
  Future<UserMasterModel> updateUser(UserForUpdate user) async {
    final token = sl<SharedPreferences>().getString("token");
    String? imageFileName = user.image == null ? null : user.image!.path.split("/").last;
    var formData = FormData.fromMap({
      "username": user.username,
      "full_name": user.fullName,
      "email": user.email,
      "newsletter": true,
      'picture': user.image == null ? null :await MultipartFile.fromFile(user.image!.path, filename: imageFileName),
    });

    dio.options.headers['content-Type'] = 'application/json; charset=UTF-8';
    dio.options.headers["Accept"] = "application/json";
    dio.options.headers["api_key"] = "9a5c786c-2762-45ab-a781-44dc705c4970";
    dio.options.headers["Authorization"] = "Bearer $token";
    try{
      final response = await dio.put(
        "https://lvfood-site.herokuapp.com/api/users/update",
        data: formData,
      );

      if (response.statusCode == 200) {
        var responseJson = json.decode(json.encode(response.data)) as Map<String, dynamic>;
        return UserMasterModel.fromJson(responseJson);
      } else {
        throw ServerException();
      }

    }on DioError catch (e){
      print(e.response);
      throw Exception(e.message);
    }
  }
}