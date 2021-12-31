
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ivfoods_mobile_app/core/error/exception.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/update_product/data/models/update_product_model.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/update_product/domain/entities/for_update_product.dart';
import 'package:ivfoods_mobile_app/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';



abstract class UpdateProductRemoteDataSource {

  /// Calls the https://lvfood-site.herokuapp.com/api/products/update/{code} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<UpdateProductModel> updateProduct(ForUpdateProduct updateProduct, String code);
}

class UpdateProductRemoteDataSourceImpl implements UpdateProductRemoteDataSource {
  final Dio dio;

  UpdateProductRemoteDataSourceImpl({required this.dio});

  @override
  Future<UpdateProductModel> updateProduct(ForUpdateProduct updateProduct, String code) async {
    final token = sl<SharedPreferences>().getString("token");

    String? imagePictureFileName = updateProduct.picture == null ? null : updateProduct.picture!.path.split("/").last;

    if(updateProduct.categories == null){
      print("cdsssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss");
    }
    var formData = FormData.fromMap({
      "name": updateProduct.name,
      "description": updateProduct.description,
      "discount": updateProduct.discount,
      "price": updateProduct.price,
      "categories": updateProduct.categories == null ? null : updateProduct.categories,
      'picture' : updateProduct.picture == null ? null : await MultipartFile.fromFile(updateProduct.picture!.path, filename: imagePictureFileName),
    });

    dio.options.headers['content-Type'] = 'application/json; charset=UTF-8';
    dio.options.headers["Accept"] = "application/json";
    dio.options.headers["api_key"] = "9a5c786c-2762-45ab-a781-44dc705c4970";
    dio.options.headers["Authorization"] = "Bearer $token";

    try{
      final response = await dio.put(
        "https://lvfood-site.herokuapp.com/api/products/update/$code",
        data: formData,
      );

      if (response.statusCode == 200) {
        var responseJson = json.decode(json.encode(response.data)) as Map<String, dynamic>;
        return UpdateProductModel.fromJson(responseJson);
      } else {
        throw ServerException();
      }

    }on DioError catch (e){
      print(e.response);
      throw Exception(e.message);
    }
  }
}