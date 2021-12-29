
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ivfoods_mobile_app/core/error/exception.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_product/data/models/create_product_model.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_product/domain/entities/for_create_product.dart';
import 'package:ivfoods_mobile_app/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CreateProductRemoteDataSource {

  /// Calls the https://lvfood-site.herokuapp.com/api/products/create endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<CreateProductModel> createProduct(ForCreateProduct createProduct);
}

class CreateProductRemoteDataSourceImpl implements CreateProductRemoteDataSource {
  final Dio dio;

  CreateProductRemoteDataSourceImpl({required this.dio});

  @override
  Future<CreateProductModel> createProduct(ForCreateProduct createProduct) async {
    final token = sl<SharedPreferences>().getString("token");

    String? imagePictureFileName = createProduct.picture == null ? null : createProduct.picture!.path.split("/").last;

    var formData = FormData.fromMap({
      "name": createProduct.name,
      "restaurant": createProduct.restaurant,
      "description": createProduct.description,
      "discount": createProduct.discount,
      "price": createProduct.price,
      "categories": createProduct.categories == null ? null : createProduct.categories,
      'picture' : await MultipartFile.fromFile(createProduct.picture!.path, filename: imagePictureFileName),
    });

    dio.options.headers['content-Type'] = 'application/json; charset=UTF-8';
    dio.options.headers["Accept"] = "application/json";
    dio.options.headers["api_key"] = "9a5c786c-2762-45ab-a781-44dc705c4970";
    dio.options.headers["Authorization"] = "Bearer $token";

    try{
      final response = await dio.post(
        "https://lvfood-site.herokuapp.com/api/products/create",
        data: formData,
      );

      if (response.statusCode == 201) {
        var responseJson = json.decode(json.encode(response.data)) as Map<String, dynamic>;
        return CreateProductModel.fromJson(responseJson);
      } else {
        throw ServerException();
      }

    }on DioError catch (e){
      print(e.response);
      throw Exception(e.message);
    }
  }
}