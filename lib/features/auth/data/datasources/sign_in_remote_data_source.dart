import 'dart:convert';
import 'package:ivfoods_mobile_app/core/error/exception.dart';
import 'package:ivfoods_mobile_app/features/auth/data/models/sign_in_response_model.dart';
import 'package:ivfoods_mobile_app/features/auth/domain/entities/sign_in_response.dart';
import 'package:ivfoods_mobile_app/features/auth/domain/entities/sign_in_user.dart';
import 'package:http/http.dart' as http;

abstract class SignInRemoteDataSource {
  /// Calls the https://lvfood-site.herokuapp.com/api/users/login endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  ///
  Future<SignInResponse> login(SignInUser user);
}

class SignInRemoteDataSourceImpl implements SignInRemoteDataSource {
  final http.Client client;

  SignInRemoteDataSourceImpl({required this.client});

  @override
  Future<SignInResponse> login(SignInUser user) async {
    final response = await client.post(
      Uri.parse("https://lvfood-site.herokuapp.com/api/users/login"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'api_key': '9a5c786c-2762-45ab-a781-44dc705c4970',
      },
      body: jsonEncode(<String, dynamic>{
        "username": user.username,
        "password": user.password,
      }),
    );

    if (response.statusCode == 202) {
      var responseJson = jsonDecode(response.body);
      var signInResponse = SignInResponseModel.fromJson(responseJson);
      return signInResponse;
    } else {
      throw ServerException();
    }
  }
}


