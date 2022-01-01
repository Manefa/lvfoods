
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ivfoods_mobile_app/core/error/exception.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_phone/data/models/add_phone_model.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_phone/domain/entities/for_add_phone.dart';
import 'package:ivfoods_mobile_app/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AddPhoneRemoteDataSource{

  /// Calls the https://lvfood-site.herokuapp.com/api/restaurants/{name}/phone/add endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<AddPhoneModel> addPhone(ForAddPhone addPhone,  String name);
}

class AddPhoneRemoteDataSourceImpl implements AddPhoneRemoteDataSource {
  final http.Client client;

  AddPhoneRemoteDataSourceImpl({required this.client});

  @override
  Future<AddPhoneModel> addPhone(ForAddPhone addPhone, String name) async {
    final token = sl<SharedPreferences>().getString("token");
    //final tokenPrime =  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb2RlIjoiVVNSLUw1TEhQVyIsImlhdCI6MTYzNTk0NDg0MCwiZXhwIjoyMjQwNzQ0ODQwfQ.5jeM4ZUKyllozNy69t3og2RgEKm2IpS4GBo0cZNeAak";
    final response = await client.put(
      Uri.parse("https://lvfood-site.herokuapp.com/api/restaurants/$name/phone/add"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'api_key': '9a5c786c-2762-45ab-a781-44dc705c4970',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, dynamic>{
          "codes": addPhone.codes,
          "contents": addPhone.contents
      }),
    );

    if (response.statusCode == 200) {
      return AddPhoneModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}