
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ivfoods_mobile_app/core/error/exception.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/update_restaurant/data/models/update_restaurant_model.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/update_restaurant/domain/entities/for_update_restaurant.dart';
import 'package:ivfoods_mobile_app/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UpdateRestaurantRemoteDataSource {

  /// Calls the https://lvfood-site.herokuapp.com/api/restaurants/update/{name} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<UpdateRestaurantModel> updateRestaurant(ForUpdateRestaurant restaurant, String name);
}

class UpdateRestaurantRemoteDataSourceImpl implements UpdateRestaurantRemoteDataSource {
  final Dio dio;

  UpdateRestaurantRemoteDataSourceImpl({required this.dio});

  @override
  Future<UpdateRestaurantModel> updateRestaurant(ForUpdateRestaurant restaurant, String name) async {
    final token = sl<SharedPreferences>().getString("token");
    String? imageProfilePictureFileName = restaurant.profilePicture == null ? null : restaurant.profilePicture!.path.split("/").last;
    String? imageCoverPictureFileName = restaurant.coverPicture == null ? null : restaurant.coverPicture!.path.split("/").last;

    var formData = FormData.fromMap({
      "name": restaurant.name,
      "email": restaurant.email,
      "description": restaurant.description,
      "address": restaurant.address,
      "country": restaurant.country,
      "city": restaurant.city,
      "district": restaurant.district,
      "latitude": restaurant.latitude == null ? null : restaurant.latitude,
      "longitude": restaurant.longitude == null ? null : restaurant.longitude,
      "styles": restaurant.styles == null ? null : restaurant.styles,
      "codes": restaurant.codes == null ? null : restaurant.codes,
      "contents": restaurant.contents == null ? null : restaurant.contents,
      "day": restaurant.day == null ? null : restaurant.day,
      "hours": restaurant.hours == null ? null : restaurant.hours,
      'profile_picture' : await MultipartFile.fromFile(restaurant.profilePicture!.path, filename: imageProfilePictureFileName),
      "cover_picture" : await MultipartFile.fromFile(restaurant.coverPicture!.path, filename: imageCoverPictureFileName),
    });

    dio.options.headers['content-Type'] = 'application/json; charset=UTF-8';
    dio.options.headers["Accept"] = "application/json";
    dio.options.headers["api_key"] = "9a5c786c-2762-45ab-a781-44dc705c4970";
    dio.options.headers["Authorization"] = "Bearer $token";
    try{
      final response = await dio.put(
        "https://lvfood-site.herokuapp.com/api/restaurants/update/$name",
        data: formData,
      );

      if (response.statusCode == 200) {
        var responseJson = json.decode(json.encode(response.data)) as Map<String, dynamic>;
        return UpdateRestaurantModel.fromJson(responseJson);
      } else {
        throw ServerException();
      }

    }on DioError catch (e){
      print(e.response);
      throw Exception(e.message);
    }
  }
}